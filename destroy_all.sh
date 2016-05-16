#!/bin/bash
rm -rf certs/*
./remove_docker_machines.sh
./destroy_swarm_lxc_nodes.sh