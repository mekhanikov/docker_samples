#!/bin/bash
docker stop phabricator
docker rm phabricator
docker network rm phabricatornet
docker network create phabricatornet
docker run -itd --name phabricator --net=phabricatornet -p 8081:80 emekhanikov/phabricator
#docker network connect phabricatornet emekhanikov_mysql56

