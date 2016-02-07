#!/bin/sh
#docker volume rm etc_mysql
docker volume rm var_lib_mysql
#docker volume create --name etc_mysql
docker volume create --name var_lib_mysql
