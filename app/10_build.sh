#!/bin/bash
docker rmi emekhanikov/app
docker build -t emekhanikov/app .
