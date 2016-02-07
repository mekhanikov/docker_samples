#!/bin/bash

THIS_DIR=`dirname $0`
#source ${THIS_DIR}/../../setenv.sh

ABSPATH=$(cd "$(dirname "$0")"; pwd)
PRJ_ROOT=${ABSPATH}/../../../

sudo rm -rf /etc/apt/sources.list
sudo cp ${PRJ_ROOT}/openstack-deploy-scripts/dev/scripts/sources.list /etc/apt/sources.list
sudo apt-get update

#sudo sh ${PRJ_ROOT}/openstack-deploy-scripts/provision/packages/unzip.sh
#sudo sh ${PRJ_ROOT}/openstack-deploy-scripts/provision/packages/java8.sh
#sudo sh ${PRJ_ROOT}/openstack-deploy-scripts/provision/packages/gradle24.sh
#sudo sh ${PRJ_ROOT}/openstack-deploy-scripts/provision/packages/nodejs.sh
#sudo sh ${PRJ_ROOT}/openstack-deploy-scripts/provision/packages/git.sh
#sh /vagrant/provision/packages/idea13.sh
${PRJ_ROOT}/openstack-deploy-scripts/dev/scripts/getsources.sh
