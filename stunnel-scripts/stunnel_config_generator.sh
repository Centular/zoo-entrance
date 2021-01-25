#!/usr/bin/env bash

# Combine all the certs in the cluster CA into one file
CA_CERTS=/tmp/cluster-ca.crt
cat /etc/cluster-ca-certs/*.crt > "$CA_CERTS"

echo "pid = /usr/local/var/run/stunnel.pid"
echo "foreground = yes"
echo "debug = $LOG_LEVEL"
echo "sslVersion = TLSv1.2"

cat <<-EOF
[zookeeper-2181]
client = yes
CAfile = ${CA_CERTS}
cert = /etc/tls-sidecar/eo-certs/entity-operator.crt
key = /etc/tls-sidecar/eo-certs/entity-operator.key
accept = ${ACCEPT}
connect = ${STRIMZI_ZOOKEEPER_CONNECT}
delay = yes
verify = 2

EOF