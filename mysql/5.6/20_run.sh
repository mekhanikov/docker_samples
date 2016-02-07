#!/bin/bash
docker stop emekhanikov_mysql56
docker rm emekhanikov_mysql56
docker network rm db
docker network create db
docker run  -d -P -itd -v var_lib_mysql:/var/lib/mysql  --net=db --name emekhanikov_mysql56 emekhanikov/mysql56
#docker network connect sonarnet emekhanikov_mysql56
#docker run --name emekhanikov/mysql56  -e MYSQL_ROOT_PASSWORD=1 -d mysql:tag
