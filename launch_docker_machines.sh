#!/bin/bash
# Can all three run in parallel, but how to do it? and then wait for all will be done?
#docker-machine create -d generic --generic-ip-address 192.168.59.107 --generic-ssh-key /home/dev/docker_samples/lxc/.vagrant/machines/default/lxc/private_key --generic-ssh-user vagrant  dev7

docker-machine create -d generic --generic-ip-address 192.161.59.101 --generic-ssh-key ./lxc-ca/.vagrant/machines/default/lxc/private_key --generic-ssh-user vagrant  ca
docker-machine create -d generic --generic-ip-address 192.162.59.102 --generic-ssh-key ./lxc-client/.vagrant/machines/default/lxc/private_key --generic-ssh-user vagrant  client
docker-machine create -d generic --generic-ip-address 192.167.59.107 --generic-ssh-key ./lxc-manager/.vagrant/machines/default/lxc/private_key --generic-ssh-user vagrant  manager
docker-machine create -d generic --generic-ip-address 192.164.59.108 --generic-ssh-key ./lxc-agent1/.vagrant/machines/default/lxc/private_key --generic-ssh-user vagrant  agent1
docker-machine create -d generic --generic-ip-address 192.169.59.109 --generic-ssh-key ./lxc-agent2/.vagrant/machines/default/lxc/private_key --generic-ssh-user vagrant  agent2
