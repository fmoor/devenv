#!/usr/bin/env bash

set -ex
sudo apt install curl git
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.2
