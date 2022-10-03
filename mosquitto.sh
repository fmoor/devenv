#!/usr/bin/env bash

set -ex

sudo apt-add-repository ppa:mosquitto-dev/mosquitto-ppa
sudo apt-get update
sudo apt-get install mosquitto mosquitto-clients

cat << EOF > /etc/mosquitto/conf.d/mosquitto.conf
listener 1883 0.0.0.0
allow_anonymous true
EOF

sudo systemctl restart mosquitto.service
