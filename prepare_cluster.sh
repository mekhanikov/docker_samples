#!/bin/bash
set -x

eval $(docker-machine env manager)
#docker run --rm swarm create
new_filename=$(docker run --rm swarm create | sed  -e '$!d')

echo "c ${new_filename} a"

#docker run -d -p 3376:3376 -t -v /var/lib/boot2docker:/certs:ro swarm manage -H 0.0.0.0:3376 --tlsverify --tlscacert=/certs/ca.pem --tlscert=/certs/server.pem --tlskey=/certs/server-key.pem token://${new_filename}
docker run -d -p 3376:3376 -t -v /home/dev/docker_samples/certs:/certs:ro swarm manage -H 0.0.0.0:3376 --tlsverify --tlscacert=/certs/ca.pem --tlscert=/certs/manager-cert.pem --tlskey=/certs/manager-priv-key.pem token://${new_filename}

#sudo docker run --rm swarm create
#sudo docker run -d -p 3376:3376 -t -v /home/vagrant/.certs:/certs:ro swarm manage -H 0.0.0.0:3376 --tlsverify --tlscacert=/home/vagrant/.certs/ca.pem --tlscert=/home/vagrant/.certs/manager-cert.pem --tlskey=/home/vagrant/.certs/manager-priv-key.pem token://${new_filename}
