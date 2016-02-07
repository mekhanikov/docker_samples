FROM ubuntu

# Latest MySQL from Oracle offical repos
ADD http://dev.mysql.com/get/mysql-apt-config_0.1.5-2ubuntu14.04_all.deb /tmp/
#VOLUME ["/etc/mysql", "/var/lib/mysql"]
RUN DEBIAN_FRONTEND=noninteractive dpkg -i /tmp/mysql-apt-config_0.1.5-2ubuntu14.04_all.deb
RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install ssh mysql-server
#RUN git clone https://github.com/MarkLeith/mysql-sys.git /tmp/mysql-sys
ADD my.cnf /etc/mysql/my.cnf
ADD mysql-init /usr/bin/mysql-init
RUN chmod +x /usr/bin/mysql-init
RUN /usr/bin/mysql-init
ADD mysql-start /usr/bin/mysql-start
RUN chmod +x /usr/bin/mysql-start
EXPOSE 22 3306
ENTRYPOINT ["/usr/bin/mysql-start"]
