#!/bin/sh
password="password"
cert="/usr/share/elasticsearch/config/certs/cert.p12"

swapoff -a

sysctl -w vm.swappiness=1

mkdir -p /usr/share/elasticsearch/config/certs

# Generate certificate
bin/elasticsearch-certutil cert \
    --ca /run/secrets/es-ca-cert \
    --out $cert \
    --ca-pass $(cat /run/secrets/es-ca-pass) \
    --pass $password \
    --silent

chown 1000:0 $cert

bin/elasticsearch-keystore create --silent
# echo $cert | bin/elasticsearch-keystore add xpack.security.transport.ssl.keystore.path
# echo $cert | bin/elasticsearch-keystore add xpack.security.transport.ssl.truststore.path
echo $password | bin/elasticsearch-keystore add xpack.security.transport.ssl.keystore.secure_password
echo $password | bin/elasticsearch-keystore add xpack.security.transport.ssl.truststore.secure_password

echo "bootpass" | bin/elasticsearch-keystore add "bootstrap.password"

exec /usr/local/bin/docker-entrypoint.sh $@
