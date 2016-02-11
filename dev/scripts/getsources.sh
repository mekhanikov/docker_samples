#!/bin/bash


THIS_DIR=`dirname $0`
#source ${THIS_DIR}/../../setenv.sh
##source ${THIS_DIR}/../setenv.sh

ABSPATH=$(cd "$(dirname "$0")"; pwd)
PRJ_ROOT=${ABSPATH}/../../../



#chmod 0600 ${SSH_KEY_PUB}
#chmod 0600 ${SSH_KEY}
#eval "$(ssh-agent -s)"
#ssh-add ${SSH_KEY}

cd ${PRJ_ROOT}

## Install Docker
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get -y install apt-transport-https

#sudo apt-get update
#sudo apt-get purge lxc-docker
#sudo apt-get upgrade -y
DEBIAN_FRONTEND=noninteractive sudo apt-get update && DEBIAN_FRONTEND=noninteractive sudo apt-get -y install linux-image-extra-$(uname -r)

sudo apt-get -y update
sudo apt-get -y install docker-engine

echo "DOCKER_OPTS='-G vagrant'" | sudo tee --append /etc/default/docker
sudo restart docker

sudo apt-get -y install git git-review python-pip python-dev

## Prepare Nova-Docker
#sudo apt-get update
#sudo apt-get install -y python-pip python-dev

##rm -rf /opt/stack/nova-docker
##sudo mkdir -p /opt/stack
git clone https://git.openstack.org/openstack/nova-docker
cd nova-docker
## Check out a different version if not using master, i.e:
#git checkout stable/liberty && sudo git pull --ff-only origin stable/liberty
git checkout stable/liberty
git pull --ff-only origin stable/liberty
##pip install .  # The linecache2 error appears to be benign
#pip install --user .
sudo pip install .
cd /home/vagrant/prj
#sudo apt-get -y install qemu-system-x86
#sudo apt-get -y install qemu-kvm
#qemu-img convert -f qcow -O qcow2 /svr/openstack-deploy-scripts/fluffy.img /home/vagrant/prj/openstack-deploy-scripts/fluffy.qcow2
sudo pip install 'stevedore<1.4.0,>=1.3.0'
sudo pip install 'requests!=2.4.0,<2.8.0,>=2.2.0'
sudo pip install 'fileutils'
git clone -b stable/liberty https://github.com/openstack-dev/devstack.git
cd devstack
exit 0
##cp ../openstack-deploy-scripts/dev/scripts/localrc ./localrc
#cp ../openstack-deploy-scripts/dev/scripts/local.conf ./local.conf
./stack.sh
sudo cp /home/vagrant/prj/nova-docker/etc/nova/rootwrap.d/docker.filters /etc/nova/rootwrap.d/
        
. openrc admin
docker pull larsks/thttpd
docker save larsks/thttpd |
  glance image-create --name larsks/thttpd \
    --container-format docker \
    --disk-format raw

. openrc demo
nova boot --image larsks/thttpd --flavor m1.small test0

exit 0
#export OS_TENANT_ID=4a3661eacc79472d8c11d714cd6e21ed
export OS_AUTH_URL=http://192.168.10.5:5000/v2.0
export OS_TENANT_NAME="demo"
export OS_USERNAME="admin"
export OS_PASSWORD=openstack
export OS_REGION_NAME="RegionOne"
#glance image-create --name "fluffy-1.0.0-x86_64" --disk-format qcow2 --container-format bare --is-public True --progress < /home/vagrant/prj/openstack-deploy-scripts/fluffy.qcow2

#nova boot --flavor m1.heat --image fluffy-1.0.0-x86_64 --security-group default  fluffy-instance
#export LANGUAGE=en_US.UTF-8
#export LANG=en_US.UTF-8
#export LC_ALL=en_US.UTF-8
#locale-gen en_US.UTF-8
#sudo dpkg-reconfigure locales

source ~/prj/devstack/openrc
nova secgroup-add-rule default tcp 22 22 0.0.0.0/0
nova secgroup-add-rule default icmp -1 -1 0.0.0.0/0
neutron subnet-update private-subnet --dns_nameservers list=true 8.8.8.8
nova floating-ip-create
#sudo iptables-save > iptables.rules
#sudo iptables -P INPUT ACCEPT
#sudo iptables -P OUTPUT ACCEPT
#sudo iptables -P FORWARD ACCEPT
#sudo iptables -F
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

sudo modprobe nbd
#sudo apt-get install mysql-server-5.6
# ./integration_tests.sh
# line="@reboot /home/vagrant/prj/openstack-deploy-scripts/onstart.sh"
# (sudo crontab -u vagrant -l; echo "$line" ) | sudo crontab -u vagrant -

#sudo cp /home/vagrant/prj/openstack-deploy-scripts/dev/files/devstack_init /etc/init.d/devstack_init
#sudo chmod ugo+x /etc/init.d/devstack_init
#sudo update-rc.d devstack_init defaults

