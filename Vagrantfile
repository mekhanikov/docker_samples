Vagrant.configure("2") do |config|
  config.vm.box = "fgrehm/trusty64-lxc"

  config.vm.network "private_network", ip: "192.168.59.105", lxc__bridge_name: 'vlxcbr1'
  #config.vm.network "private_network", ip: "192.168.59.105"
  config.vm.provider :lxc do |lxc|
#  config.vm.define "n1" do |node|
#    #node.vm.network "private_network", :adapter=>2, ip: "192.168.1.1",virtualbox__intnet: "cluster", lxc__bridge_name:'cluster'
#    #node.vm.network "private_network", :adapter=>3, ip: "192.168.0.1",virtualbox__intnet: "private", lxc__bridge_name:'private'
#    config.vm.network :private_network, ip: "172.20.10.3", lxc__bridge_name: 'vlxcbr1'
#  end
    # Same effect as 'customize ["modifyvm", :id, "--memory", "5024"]' for VirtualBox
    lxc.customize 'cgroup.memory.limit_in_bytes', '5024M'
    lxc.customize 'cgroup.devices.allow', 'b 7:* rwm'
    lxc.customize 'cgroup.devices.allow', 'c 10:237 rwm'
    lxc.customize 'cgroup.devices.deny', ''

lxc.customize 'aa_profile', 'unconfined'
lxc.customize 'cgroup.devices.allow', 'a'
lxc.customize 'cap.drop', ''

  end

config.vm.synced_folder ".", "/svr/openstack-deploy-scripts"
#config.vm.provision :shell, :inline => "cp -a /svr/openstack-deploy-scripts/ssh/. /home/vagrant/.ssh/", :privileged => false
config.vm.provision :shell, :inline => "mkdir -p /home/vagrant/prj; cp -r /svr/openstack-deploy-scripts/. /home/vagrant/prj/openstack-deploy-scripts/", :privileged => false
config.vm.provision :shell, :inline => "cd /home/vagrant/prj/openstack-deploy-scripts/dev; pwd; ls -lah; scripts/init.sh", :privileged => false

end
