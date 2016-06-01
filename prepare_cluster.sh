#!/bin/bash
set -x

eval $(docker-machine env manager)
#docker run --rm swarm create
new_filename=$(docker run --rm swarm create | sed  -e '$!d')

echo "c ${new_filename} a"

#docker run -d -p 3376:3376 -t -v /var/lib/boot2docker:/certs:ro swarm manage -H 0.0.0.0:3376 --tlsverify --tlscacert=/certs/ca.pem --tlscert=/certs/server.pem --tlskey=/certs/server-key.pem token://${new_filename}
docker run -d -p 3376:3376 -t -v /home/vagrant/.certs:/certs:ro swarm manage -H 0.0.0.0:3376 --tlsverify --tlscacert=/certs/ca.pem --tlscert=/certs/cert.pem --tlskey=/certs/key.pem token://${new_filename}
#docker run -d -p 3376:3376 -t -v /home/vagrant/.certs:/certs:ro swarm manage -H 0.0.0.0:3376 token://${new_filename}
#docker run -d -p 3376:3376 -t -v /home/vagrant/.certs:/certs:ro swarm manage -H 0.0.0.0:3376 --tlsverify --tlscacert=/certs/ca.pem --tlscert=/certs/cert.pem --tlskey=/certs/key.pem token://9bfa4b8e3ffae4c1707100b0dcd4caeb

#sudo docker run --rm swarm create
#sudo docker run -d -p 3376:3376 -t -v /home/vagrant/.certs:/certs:ro swarm manage -H 0.0.0.0:3376 --tlsverify --tlscacert=/home/vagrant/.certs/ca.pem --tlscert=/home/vagrant/.certs/manager-cert.pem --tlskey=/home/vagrant/.certs/manager-priv-key.pem token://9bfa4b8e3ffae4c1707100b0dcd4caeb

eval $(docker-machine env agent1)
docker run -d swarm join --addr=agent1:2376 token://${new_filename}
#docker run -d swarm join --addr=$(docker-machine ip agent1):2376 token://9bfa4b8e3ffae4c1707100b0dcd4caeb

#eval $(docker-machine env agent2)
#docker run -d swarm join --addr=$(docker-machine ip agent2):2376 token://${new_filename}
#docker run -d swarm join --addr=$(docker-machine ip agent2):2376 token://9bfa4b8e3ffae4c1707100b0dcd4caeb

export DOCKER_OPTS1="-H manager:3376 --tls --tlskey /home/dev/docker_samples/certs/manager-priv-key.pem --tlscert /home/dev/docker_samples/certs/manager-cert.pem --tlsverify --tlscacert /home/dev/docker_samples/certs/ca.pem"

docker $DOCKER_OPTS1 info
