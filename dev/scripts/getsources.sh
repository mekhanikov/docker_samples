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
git checkout stable/liberty
git checkout 113e78f91573447ede534b2f334e04c86533e8ea
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
git checkout 501bb07462ef4fbe81143f0a58364ada0da48fe2
#sudo pip install 'stevedore<1.4.0,>=1.3.0'
#sudo pip install 'requests!=2.4.0,<2.8.0,>=2.2.0'
#sudo pip install 'fileutils'
##cp ../openstack-deploy-scripts/dev/scripts/localrc ./localrc
cp ../openstack-deploy-scripts/dev/scripts/local.conf ./local.conf
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


nova floating-ip-create
nova floating-ip-associate test0 172.24.4.3

nova list


nova secgroup-add-rule default tcp 80 80 0.0.0.0/0
nova secgroup-add-rule default tcp 22 22 0.0.0.0/0
nova secgroup-add-rule default icmp -1 -1 0.0.0.0/0
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
neutron subnet-update private-subnet --dns_nameservers list=true 8.8.8.8

#sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
#sudo modprobe nbd

#sudo apt-get install mysql-server-5.6
# ./integration_tests.sh
# line="@reboot /home/vagrant/prj/openstack-deploy-scripts/onstart.sh"
# (sudo crontab -u vagrant -l; echo "$line" ) | sudo crontab -u vagrant -

#sudo cp /home/vagrant/prj/openstack-deploy-scripts/dev/files/devstack_init /etc/init.d/devstack_init
#sudo chmod ugo+x /etc/init.d/devstack_init
#sudo update-rc.d devstack_init defaults

