#!/bin/bash
#set -x
THIS_DIR=`dirname $0`
#source ${THIS_DIR}/../../setenv.sh

ABSPATH=$(cd "$(dirname "$0")"; pwd)
PRJ_ROOT=${ABSPATH}/../../../

cd certs
openssl genrsa -out ca-priv-key.pem 2048
#openssl req -config /usr/lib/ssl/openssl.cnf -new -key ca-priv-key.pem -x509 -days 1825 -out ca.pem
openssl req -config /usr/lib/ssl/openssl.cnf -new -key ca-priv-key.pem -x509 -days 1825 -out ca.pem -subj "/C=UK/ST=Warwickshire/L=Leamington/O=OrgName/OU=IT Department/CN=example.com"

openssl genrsa -out agent1-priv-key.pem 2048
openssl req -subj "/CN=agent1" -new -key agent1-priv-key.pem -out agent1.csr
openssl x509 -req -days 1825 -in agent1.csr -CA ca.pem -CAkey ca-priv-key.pem -CAcreateserial -out agent1-cert.pem -extensions v3_req -extfile /usr/lib/ssl/openssl.cnf
openssl rsa -in agent1-priv-key.pem -out agent1-priv-key.pem

openssl genrsa -out agent2-priv-key.pem 2048
openssl req -subj "/CN=agent2" -new -key agent2-priv-key.pem -out agent2.csr
openssl x509 -req -days 1825 -in agent2.csr -CA ca.pem -CAkey ca-priv-key.pem -CAcreateserial -out agent2-cert.pem -extensions v3_req -extfile /usr/lib/ssl/openssl.cnf
openssl rsa -in agent2-priv-key.pem -out agent2-priv-key.pem

openssl genrsa -out client-priv-key.pem 2048
openssl req -subj "/CN=client" -new -key client-priv-key.pem -out client.csr
openssl x509 -req -days 1825 -in client.csr -CA ca.pem -CAkey ca-priv-key.pem -CAcreateserial -out client-cert.pem -extensions v3_req -extfile /usr/lib/ssl/openssl.cnf
openssl rsa -in client-priv-key.pem -out client-priv-key.pem

openssl genrsa -out manager-priv-key.pem 2048
openssl req -subj "/CN=manager" -new -key manager-priv-key.pem -out manager.csr
openssl x509 -req -days 1825 -in manager.csr -CA ca.pem -CAkey ca-priv-key.pem -CAcreateserial -out manager-cert.pem -extensions v3_req -extfile /usr/lib/ssl/openssl.cnf
openssl rsa -in manager-priv-key.pem -out manager-priv-key.pem


chmod 0600  *.pem


ls -lah

cd ..