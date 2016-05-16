#!/bin/bash
./create_certs.sh
./run_swarm_lxc_nodes.sh
./launch_docker_machines.sh