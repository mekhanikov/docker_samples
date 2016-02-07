FROM ubuntu

RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install git php5-cli php5-mysql php5-gd

#RUN rm /etc/httpd/conf.d/welcome.conf
RUN mkdir /var/repo
COPY ./files/apache_vhost.conf /etc/httpd/conf.d/phabricator.conf
COPY ./files/supervisord.conf /etc/
COPY ./files/check_db.sh /opt/check_db.sh
RUN git clone git://github.com/facebook/libphutil.git /var/www/libphutil
RUN git clone git://github.com/facebook/arcanist.git /var/www/arcanist
RUN git clone git://github.com/facebook/phabricator.git /var/www/phabricator
RUN sed -i -e "s/apc.stat=1/apc.stat=0/" /etc/php.d/apc.ini
VOLUME ["/var/lib/mysql","/var/repo"]
CMD ["supervisord", "-n"]
