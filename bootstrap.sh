#!/usr/bin/env bash

# install ssh key
# clone this repo

set -ex

sudo apt update
sudo apt full-upgrade -y
sudo apt autoremove -y

mkdir ~/src
git clone git@github.com:fmoor/dotfiles.git ~/src/dotfiles

source rust.sh
source alacritty.sh
source bash.sh
source vim.sh
source docker.sh
source gnome.sh
source notable.sh
source go.sh
