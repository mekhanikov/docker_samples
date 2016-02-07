#!/bin/bash
#docker run --name emekhanikov/mysql56  -e MYSQL_ROOT_PASSWORD=1 -d mysql:tag
#docker create -v /etc/mysql --name etc_mysql emekhanikov/mysql56 /bin/true

cd mysql/5.6
./20_run.sh
cd ../..

cd app
./20_run.sh
cd ..

cd sonarqube
./20_run.sh




#docker run hello-world
#docker run --name emekhanikov_mysql56 -e MYSQL_ROOT_PASSWORD=1 -p 3306:3306 -t -i emekhanikov/mysql56

# ping myapp.app
# sudo apt-get install mysql-client
# mysql -uroot -p -h emekhanikov_mysql56.app
# mysql -uroot -h myapp.app
# mysql -uroot -p1 -h 
