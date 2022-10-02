#!/usr/bin/env bash

set -ex

(

curl -sL https://download.notable.app/?target=deb --output /tmp/notable.deb
sudo dpkg -i /tmp/notable.deb

)
