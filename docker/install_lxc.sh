sudo apt-get -y update && sudo apt-get -y install lxc
echo 'lxc.aa_profile = unconfined' | sudo tee --append /etc/lxc/default.conf
echo 'lxc.cgroup.devices.allow = a' | sudo tee --append /etc/lxc/default.conf
echo 'lxc.cap.drop =' | sudo tee --append /etc/lxc/default.conf

sudo lxc-create -t download -n test01 -- -d ubuntu -r trusty -a amd64
sudo lxc-start -n test01 -d

sudo lxc-attach --name=test01

# run lines botton inside container.
# apt-get -y install wget apparmor => [Needed by docker, otherwise docker upstart will fail]
# wget -qO- https://get.docker.com/ | sh
