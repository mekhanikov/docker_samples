Vagrant.configure("2") do |config|
  config.vm.box = "fgrehm/trusty64-lxc"
  config.vm.network "private_network", ip: "192.168.10.5", lxc__bridge_name: 'vlxcbr1'
  config.vm.provider :lxc do |lxc|
    # Same effect as 'customize ["modifyvm", :id, "--memory", "1024"]' for VirtualBox
    lxc.customize 'cgroup.memory.limit_in_bytes', '1024M'
    lxc.customize 'cgroup.devices.allow', 'b 7:* rwm'
    lxc.customize 'cgroup.devices.allow', 'c 10:237 rwm'
    lxc.customize 'cgroup.devices.deny', ''
  end

config.vm.synced_folder ".", "/svr/openstack-deploy-scripts"
#config.vm.provision :shell, :inline => "cp -a /svr/openstack-deploy-scripts/ssh/. /home/vagrant/.ssh/", :privileged => false
config.vm.provision :shell, :inline => "mkdir -p /home/vagrant/prj; cp -r /svr/openstack-deploy-scripts/. /home/vagrant/prj/openstack-deploy-scripts/", :privileged => false
config.vm.provision :shell, :inline => "cd /home/vagrant/prj/openstack-deploy-scripts/dev; pwd; ls -lah; scripts/init.sh", :privileged => false

end
