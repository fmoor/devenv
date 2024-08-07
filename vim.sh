#!/usr/bin/env bash

set -ex

# asdf is required
# dotfiles is required

(

cd
mkdir -p ~/.vimbackup
mkdir -p ~/.vimswap
mkdir -p ~/.vim
asdf plugin add nodejs || true
asdf install nodejs 17.9.0 || true
asdf global nodejs 17.9.0 || true
npm install --global yarn
ln -fs ~/src/dotfiles/vimrc ~/.vimrc
ln -fs ~/src/dotfiles/vim-ftplugin ~/.vim/ftplugin

sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install -y vim-gtk
# PlugInstall

)
