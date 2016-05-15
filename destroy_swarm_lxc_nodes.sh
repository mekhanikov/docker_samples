#!/bin/bash

cd lxc-manager
vagrant destroy -f

cd ..
cd lxc-agent1
vagrant destroy -f

cd ..
cd lxc-agent2
vagrant destroy -f

cd ..
cd lxc-ca
vagrant destroy -f

cd ..
cd lxc-client
vagrant destroy -f