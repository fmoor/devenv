#!/usr/bin/env bash

set -ex

sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git
sudo apt upgrade -y
