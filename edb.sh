#!/usr/bin/env bash

# https://www.edgedb.com/docs/guides/contributing 

set -ex

sudo apt update
sudo apt install -y \
	autotools-dev \
	bison \
	flex \
	zlib1g-dev \
	libreadline-dev \
	uuid-dev
