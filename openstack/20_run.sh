#!/bin/bash
docker stop openstack
docker rm openstack
docker network rm openstacknet
docker network create openstacknet
docker run  -d -P -itd -v var_lib_mysql:/var/lib/mysql  --net=openstacknet --name openstack emekhanikov/openstack
#docker network connect sonarnet emekhanikov_mysql56
#docker run --name emekhanikov/mysql56  -e MYSQL_ROOT_PASSWORD=1 -d mysql:tag
