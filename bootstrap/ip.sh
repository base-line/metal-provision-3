#!/usr/bin/env bash

# configuring ElasticIP
ELASTIC_IP=$(echo ${ip} | sed 's/\(.*\).../\1/')

ip addr add $ELASTIC_IP dev lo

cat <<EOF>> /etc/network/interfaces
auto lo:0
iface lo:0 inet static
    address $ELASTIC_IP
    netmask ${netmask}
EOF