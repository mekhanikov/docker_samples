#!/bin/bash
docker stop myapp
docker rm myapp
docker network rm app
docker network create app
#docker run -it  --rm --name myapp --net=app ubuntu
docker run -itd --name myapp --net=app emekhanikov/app
docker network connect app emekhanikov_mysql56
