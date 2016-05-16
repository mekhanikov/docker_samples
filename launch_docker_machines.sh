#!/bin/bash
# Can all three run in parallel, but how to do it? and then wait for all will be done?
#docker-machine create -d generic --generic-ip-address 192.168.59.107 --generic-ssh-key /home/dev/docker_samples/lxc/.vagrant/machines/default/lxc/private_key --generic-ssh-user vagrant  dev7

docker-machine create -d generic --generic-ip-address 192.161.59.101 --generic-ssh-key ./lxc-ca/.vagrant/machines/default/lxc/private_key --generic-ssh-user vagrant  ca
docker-machine create -d generic --generic-ip-address 192.162.59.102 --generic-ssh-key ./lxc-client/.vagrant/machines/default/lxc/private_key --generic-ssh-user vagrant  client
docker-machine create -d generic --generic-ip-address 192.167.59.107 --generic-ssh-key ./lxc-manager/.vagrant/machines/default/lxc/private_key --generic-ssh-user vagrant  manager
docker-machine create -d generic --generic-ip-address 192.164.59.108 --generic-ssh-key ./lxc-agent1/.vagrant/machines/default/lxc/private_key --generic-ssh-user vagrant  agent1
docker-machine create -d generic --generic-ip-address 192.169.59.109 --generic-ssh-key ./lxc-agent2/.vagrant/machines/default/lxc/private_key --generic-ssh-user vagrant  agent2


ssh -oStrictHostKeyChecking=no -i /home/dev/docker_samples/lxc-manager/.vagrant/machines/default/lxc/private_key vagrant@192.167.59.107 "mkdir -p /home/vagrant/.certs"
scp -i /home/dev/docker_samples/lxc-manager/.vagrant/machines/default/lxc/private_key ./ca.pem vagrant@192.167.59.107:/home/vagrant/.certs/ca.pem
scp -i /home/dev/docker_samples/lxc-manager/.vagrant/machines/default/lxc/private_key ./manager-priv-key.pem vagrant@192.167.59.107:/home/vagrant/.certs/key.pem
scp -i /home/dev/docker_samples/lxc-manager/.vagrant/machines/default/lxc/private_key ./manager-cert.pem vagrant@192.167.59.107:/home/vagrant/.certs/cert.pem

ssh -oStrictHostKeyChecking=no -i /home/dev/docker_samples/lxc-client/.vagrant/machines/default/lxc/private_key vagrant@192.162.59.102 "mkdir -p /home/vagrant/.certs"
scp -i /home/dev/docker_samples/lxc-client/.vagrant/machines/default/lxc/private_key ./ca.pem vagrant@192.162.59.102:/home/vagrant/.certs/ca.pem
scp -i /home/dev/docker_samples/lxc-client/.vagrant/machines/default/lxc/private_key ./client-priv-key.pem vagrant@192.162.59.102:/home/vagrant/.certs/key.pem
scp -i /home/dev/docker_samples/lxc-client/.vagrant/machines/default/lxc/private_key ./client-cert.pem vagrant@192.162.59.102:/home/vagrant/.certs/cert.pem

ssh -oStrictHostKeyChecking=no -i /home/dev/docker_samples/lxc-agent1/.vagrant/machines/default/lxc/private_key vagrant@192.164.59.108 "mkdir -p /home/vagrant/.certs"
scp -i /home/dev/docker_samples/lxc-agent1/.vagrant/machines/default/lxc/private_key ./ca.pem vagrant@192.164.59.108:/home/vagrant/.certs/ca.pem
scp -i /home/dev/docker_samples/lxc-agent1/.vagrant/machines/default/lxc/private_key ./agent1-priv-key.pem vagrant@192.164.59.108:/home/vagrant/.certs/key.pem
scp -i /home/dev/docker_samples/lxc-agent1/.vagrant/machines/default/lxc/private_key ./agent1-cert.pem vagrant@192.164.59.108:/home/vagrant/.certs/cert.pem

ssh -oStrictHostKeyChecking=no -i /home/dev/docker_samples/lxc-agent2/.vagrant/machines/default/lxc/private_key vagrant@192.169.59.109 "mkdir -p /home/vagrant/.certs"
scp -i /home/dev/docker_samples/lxc-agent2/.vagrant/machines/default/lxc/private_key ./ca.pem vagrant@192.169.59.109:/home/vagrant/.certs/ca.pem
scp -i /home/dev/docker_samples/lxc-agent2/.vagrant/machines/default/lxc/private_key ./agent2-priv-key.pem vagrant@192.169.59.109:/home/vagrant/.certs/key.pem
scp -i /home/dev/docker_samples/lxc-agent2/.vagrant/machines/default/lxc/private_key ./agent2-cert.pem vagrant@192.169.59.109:/home/vagrant/.certs/cert.pem

ssh -oStrictHostKeyChecking=no -i /home/dev/docker_samples/lxc-ca/.vagrant/machines/default/lxc/private_key vagrant@192.161.59.101 "mkdir -p /home/vagrant/.certs"
scp -i /home/dev/docker_samples/lxc-ca/.vagrant/machines/default/lxc/private_key ./ca.pem vagrant@192.161.59.101:/home/vagrant/.certs/ca.pem
scp -i /home/dev/docker_samples/lxc-ca/.vagrant/machines/default/lxc/private_key ./ca-priv-key.pem vagrant@192.161.59.101:/home/vagrant/.certs/ca-priv-key.pem
scp -i /home/dev/docker_samples/lxc-ca/.vagrant/machines/default/lxc/private_key ./ca-cert.pem vagrant@192.161.59.101:/home/vagrant/.certs/ca-cert.pem
scp -i /home/dev/docker_samples/lxc-ca/.vagrant/machines/default/lxc/private_key ./manager-priv-key.pem vagrant@192.161.59.101:/home/vagrant/.certs/manager-priv-key.pem
scp -i /home/dev/docker_samples/lxc-ca/.vagrant/machines/default/lxc/private_key ./manager-cert.pem vagrant@192.161.59.101:/home/vagrant/.certs/manager-cert.pem
scp -i /home/dev/docker_samples/lxc-ca/.vagrant/machines/default/lxc/private_key ./agent1-priv-key.pem vagrant@192.161.59.101:/home/vagrant/.certs/agent1-priv-key.pem
scp -i /home/dev/docker_samples/lxc-ca/.vagrant/machines/default/lxc/private_key ./agent1-cert.pem vagrant@192.161.59.101:/home/vagrant/.certs/agent1-cert.pem
scp -i /home/dev/docker_samples/lxc-ca/.vagrant/machines/default/lxc/private_key ./agent2-priv-key.pem vagrant@192.161.59.101:/home/vagrant/.certs/agent2-priv-key.pem
scp -i /home/dev/docker_samples/lxc-ca/.vagrant/machines/default/lxc/private_key ./agent2-cert.pem vagrant@192.161.59.101:/home/vagrant/.certs/agent2-cert.pem
