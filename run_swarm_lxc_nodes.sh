#!/bin/bash

# Can all three run in parallel, but how to do it? and then wait for all will be done?
cd lxc-manager
vagrant up

cd ..
cd lxc-agent1
vagrant up

cd ..
cd lxc-agent2
vagrant up

cd ..
cd lxc-ca
vagrant up

cd ..
cd lxc-client
vagrant up