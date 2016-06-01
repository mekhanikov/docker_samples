#!/bin/bash

ssh -oStrictHostKeyChecking=no -i /home/dev/docker_samples/lxc-manager/.vagrant/machines/default/lxc/private_key vagrant@192.167.59.107 "mkdir -p /home/vagrant/.certs"
scp -i /home/dev/docker_samples/lxc-manager/.vagrant/machines/default/lxc/private_key certs/ca.pem vagrant@192.167.59.107:/home/vagrant/.certs/ca.pem
scp -i /home/dev/docker_samples/lxc-manager/.vagrant/machines/default/lxc/private_key certs/manager-priv-key.pem vagrant@192.167.59.107:/home/vagrant/.certs/key.pem
scp -i /home/dev/docker_samples/lxc-manager/.vagrant/machines/default/lxc/private_key certs/manager-cert.pem vagrant@192.167.59.107:/home/vagrant/.certs/cert.pem

#ssh -oStrictHostKeyChecking=no -i /home/dev/docker_samples/lxc-client/.vagrant/machines/default/lxc/private_key vagrant@192.162.59.102 "mkdir -p /home/vagrant/.certs"
#scp -i /home/dev/docker_samples/lxc-client/.vagrant/machines/default/lxc/private_key certs/ca.pem vagrant@192.162.59.102:/home/vagrant/.certs/ca.pem
#scp -i /home/dev/docker_samples/lxc-client/.vagrant/machines/default/lxc/private_key certs/client-priv-key.pem vagrant@192.162.59.102:/home/vagrant/.certs/key.pem
#scp -i /home/dev/docker_samples/lxc-client/.vagrant/machines/default/lxc/private_key certs/client-cert.pem vagrant@192.162.59.102:/home/vagrant/.certs/cert.pem

ssh -oStrictHostKeyChecking=no -i /home/dev/docker_samples/lxc-agent1/.vagrant/machines/default/lxc/private_key vagrant@192.164.59.108 "mkdir -p /home/vagrant/.certs"
scp -i /home/dev/docker_samples/lxc-agent1/.vagrant/machines/default/lxc/private_key certs/ca.pem vagrant@192.164.59.108:/home/vagrant/.certs/ca.pem
scp -i /home/dev/docker_samples/lxc-agent1/.vagrant/machines/default/lxc/private_key certs/agent1-priv-key.pem vagrant@192.164.59.108:/home/vagrant/.certs/key.pem
scp -i /home/dev/docker_samples/lxc-agent1/.vagrant/machines/default/lxc/private_key certs/agent1-cert.pem vagrant@192.164.59.108:/home/vagrant/.certs/cert.pem

#ssh -oStrictHostKeyChecking=no -i /home/dev/docker_samples/lxc-agent2/.vagrant/machines/default/lxc/private_key vagrant@192.169.59.109 "mkdir -p /home/vagrant/.certs"
#scp -i /home/dev/docker_samples/lxc-agent2/.vagrant/machines/default/lxc/private_key certs/ca.pem vagrant@192.169.59.109:/home/vagrant/.certs/ca.pem
#scp -i /home/dev/docker_samples/lxc-agent2/.vagrant/machines/default/lxc/private_key certs/agent2-priv-key.pem vagrant@192.169.59.109:/home/vagrant/.certs/key.pem
#scp -i /home/dev/docker_samples/lxc-agent2/.vagrant/machines/default/lxc/private_key certs/agent2-cert.pem vagrant@192.169.59.109:/home/vagrant/.certs/cert.pem

ssh -oStrictHostKeyChecking=no -i /home/dev/docker_samples/lxc-ca/.vagrant/machines/default/lxc/private_key vagrant@192.161.59.101 "mkdir -p /home/vagrant/.certs"
scp -i /home/dev/docker_samples/lxc-ca/.vagrant/machines/default/lxc/private_key certs/ca.pem vagrant@192.161.59.101:/home/vagrant/.certs/ca.pem
scp -i /home/dev/docker_samples/lxc-ca/.vagrant/machines/default/lxc/private_key certs/ca-priv-key.pem vagrant@192.161.59.101:/home/vagrant/.certs/ca-priv-key.pem
#scp -i /home/dev/docker_samples/lxc-ca/.vagrant/machines/default/lxc/private_key certs/ca-cert.pem vagrant@192.161.59.101:/home/vagrant/.certs/ca-cert.pem
scp -i /home/dev/docker_samples/lxc-ca/.vagrant/machines/default/lxc/private_key certs/manager-priv-key.pem vagrant@192.161.59.101:/home/vagrant/.certs/manager-priv-key.pem
scp -i /home/dev/docker_samples/lxc-ca/.vagrant/machines/default/lxc/private_key certs/manager-cert.pem vagrant@192.161.59.101:/home/vagrant/.certs/manager-cert.pem
scp -i /home/dev/docker_samples/lxc-ca/.vagrant/machines/default/lxc/private_key certs/agent1-priv-key.pem vagrant@192.161.59.101:/home/vagrant/.certs/agent1-priv-key.pem
scp -i /home/dev/docker_samples/lxc-ca/.vagrant/machines/default/lxc/private_key certs/agent1-cert.pem vagrant@192.161.59.101:/home/vagrant/.certs/agent1-cert.pem
#scp -i /home/dev/docker_samples/lxc-ca/.vagrant/machines/default/lxc/private_key certs/agent2-priv-key.pem vagrant@192.161.59.101:/home/vagrant/.certs/agent2-priv-key.pem
#scp -i /home/dev/docker_samples/lxc-ca/.vagrant/machines/default/lxc/private_key certs/agent2-cert.pem vagrant@192.161.59.101:/home/vagrant/.certs/agent2-cert.pem
