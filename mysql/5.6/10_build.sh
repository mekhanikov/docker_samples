#!/bin/bash
docker rmi emekhanikov/mysql56
docker build -t emekhanikov/mysql56 .
