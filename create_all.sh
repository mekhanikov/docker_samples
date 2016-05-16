#!/bin/bash
./destroy_all.sh
./create_certs.sh
./run_swarm_lxc_nodes.sh
./launch_docker_machines.sh
./upload_certs.sh
