#!/bin/bash
docker rmi emekhanikov/phabricator
docker build -t emekhanikov/phabricator .
