#!/bin/bash
#docker rmi $(docker images -a -q)

cd mysql/5.6
./10_build.sh
cd ../..

cd app
./10_build.sh
cd ..

cd sonarqube
./10_build.sh
