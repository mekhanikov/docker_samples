#!/bin/bash

# Can all three run in parallel, but how to do it? and then wait for all will be done?
#pwd

cd lxc-manager
vagrant up

#pwd
cd ..
#pwd
#ls
#exit 0

cd lxc-agent1
vagrant up

cd ..
cd lxc-agent2
vagrant up
