#!/bin/bash
docker stop sonar
docker rm sonar
docker network rm sonarnet
docker network create sonarnet
docker run -itd --name sonar --net=sonarnet -p 9000:9000 emekhanikov/sonarqube
docker network connect sonarnet emekhanikov_mysql56
#docker run --name emekhanikov/mysql56  -e MYSQL_ROOT_PASSWORD=1 -d mysql:tag
