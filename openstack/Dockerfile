FROM ubuntu:14.04
MAINTAINER examples@docker.com

ADD http://dev.mysql.com/get/mysql-apt-config_0.1.5-2ubuntu14.04_all.deb /tmp/
RUN DEBIAN_FRONTEND=noninteractive dpkg -i /tmp/mysql-apt-config_0.1.5-2ubuntu14.04_all.deb
RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install ssh mysql-server git
ADD my.cnf /etc/mysql/my.cnf
ADD mysql-init /usr/bin/mysql-init
RUN chmod +x /usr/bin/mysql-init
RUN /usr/bin/mysql-init
ADD mysql-start /usr/bin/mysql-start
RUN chmod +x /usr/bin/mysql-start
EXPOSE 22 3306
ENTRYPOINT ["/usr/bin/mysql-start"]

RUN apt-get update && apt-get install -y git bsdmainutils python python-pip

RUN git clone -b stable/liberty https://github.com/openstack-dev/devstack.git

COPY localrc /devstack/localrc
#COPY local.conf /devstack/local.conf



RUN adduser --disabled-password --gecos '' r
RUN adduser r sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN chown -R r:r devstack

RUN su - r -c "pip install --user  testrepository"
RUN pip install testrepository

RUN su - r -c /devstack/stack.sh
