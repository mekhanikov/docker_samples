FROM ubuntu:14.04

RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' | sudo tee /etc/apt/sources.list.d/docker.list
RUN apt-get -y install apt-transport-https
RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install linux-image-extra-$(uname -r)

RUN apt-get -y update
RUN apt-get -y install docker-engine


RUN apt-get update
RUN apt-get -y install git git-review python-pip python-dev

RUN adduser --disabled-password --gecos '' dev
RUN adduser dev sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN echo "DOCKER_OPTS='-G dev'"  | sudo tee --append /etc/default/docker
#sudo restart docker

#git clone http://github.com/stackforge/nova-docker.git
#cd nova-docker
#git checkout stable/kilo

