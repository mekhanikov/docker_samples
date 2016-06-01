#!/bin/bash
#set -x
THIS_DIR=`dirname $0`
#source ${THIS_DIR}/../../setenv.sh

ABSPATH=$(cd "$(dirname "$0")"; pwd)
PRJ_ROOT=${ABSPATH}/../../../

# Create a directory for the CA and switch to it
mkdir /root/ca
cd /root/ca

# Create some (necessary) directories
mkdir newcerts certs crl private requests

# Get a copy of the standard SSL configuration
cp /home/vagrant/prj/lxc/openssl.cnf ./config.txt

# Create some necessary files
touch index.txt
echo '01' > serial

ls -lah
set -x
rm -rf /certs/*
openssl genrsa -out private/cakey.pem 4096
openssl req -new -x509 -key private/cakey.pem -out cacert.pem -days 3650 -set_serial 0 -subj "/C=US/ST=CA/L=Sanfrancisco/O=OrgName"
#chmod -R 600 /root/ca
cp private/cakey.pem /certs/ca-priv-key.pem
cp cacert.pem /certs/ca.pem

#cd /root/ca/requests
#openssl genrsa -des3 -out webserverkey.pem 2048
#openssl req -new -key webserverkey.pem -out webservercert.csr -days 3650
#openssl ca -in webservercert.csr -out webservercert.pem -config /root/ca/config.txt


# ----
cd /root/ca/requests

openssl genrsa -out manager-priv-key.pem 2048
openssl req -subj "/CN=manager" -new -key manager-priv-key.pem -out manager.csr
#openssl req                     -new -key manager-priv-key.pem -out manager.csr -days 3650
openssl ca -batch -in manager.csr -out manager-cert.pem -config /root/ca/config.txt
#openssl rsa -in manager-priv-key.pem -out manager-priv-key.pem
cp manager-cert.pem /certs/manager-cert.pem
cp manager-priv-key.pem /certs/manager-priv-key.pem

openssl genrsa -out agent1-priv-key.pem 2048
openssl req -subj "/CN=agent1" -new -key agent1-priv-key.pem -out agent1.csr
#openssl req                     -new -key agent1-priv-key.pem -out agent1.csr -days 3650
openssl ca -batch -in agent1.csr -out agent1-cert.pem -config /root/ca/config.txt
#openssl rsa -in agent1-priv-key.pem -out agent1-priv-key.pem
cp agent1-cert.pem /certs/agent1-cert.pem
cp agent1-priv-key.pem /certs/agent1-priv-key.pem
# ----
#
#cd /certs
#openssl genrsa -out ca-priv-key.pem 2048
##openssl req -config /usr/lib/ssl/openssl.cnf -new -key ca-priv-key.pem -x509 -days 1825 -out ca.pem
#openssl req -config /usr/lib/ssl/openssl.cnf -new -key ca-priv-key.pem -x509 -days 1825 -out ca.pem -subj "/C=US/ST=CA/L=Sanfrancisco/O=OrgName"
#
#openssl genrsa -out agent1-priv-key.pem 2048
#openssl req -subj "/CN=agent1" -new -key agent1-priv-key.pem -out agent1.csr
#openssl x509 -req -days 1825 -in agent1.csr -CA ca.pem -CAkey ca-priv-key.pem -CAcreateserial -out agent1-cert.pem -extensions v3_req -extfile /usr/lib/ssl/openssl.cnf
#openssl rsa -in agent1-priv-key.pem -out agent1-priv-key.pem
#
#openssl genrsa -out agent2-priv-key.pem 2048
#openssl req -subj "/CN=agent2" -new -key agent2-priv-key.pem -out agent2.csr
#openssl x509 -req -days 1825 -in agent2.csr -CA ca.pem -CAkey ca-priv-key.pem -CAcreateserial -out agent2-cert.pem -extensions v3_req -extfile /usr/lib/ssl/openssl.cnf
#openssl rsa -in agent2-priv-key.pem -out agent2-priv-key.pem
#
#openssl genrsa -out client-priv-key.pem 2048
#openssl req -subj "/CN=client" -new -key client-priv-key.pem -out client.csr
#openssl x509 -req -days 1825 -in client.csr -CA ca.pem -CAkey ca-priv-key.pem -CAcreateserial -out client-cert.pem -extensions v3_req -extfile /usr/lib/ssl/openssl.cnf
#openssl rsa -in client-priv-key.pem -out client-priv-key.pem
#
#openssl genrsa -out manager-priv-key.pem 2048
#openssl req -subj "/CN=manager" -new -key manager-priv-key.pem -out manager.csr
#openssl x509 -req -days 1825 -in manager.csr -CA ca.pem -CAkey ca-priv-key.pem -CAcreateserial -out manager-cert.pem -extensions v3_req -extfile /usr/lib/ssl/openssl.cnf
#openssl rsa -in manager-priv-key.pem -out manager-priv-key.pem

#chmod -R 0600  *
cd /root/ca
chown -R vagrant:vagrant *

ls -lah
pwd
cd ..