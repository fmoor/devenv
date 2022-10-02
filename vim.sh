#!/usr/bin/env bash

set -ex

(

cd
mkdir -p ~/.vimbackup
mkdir -p ~/.vimswap
mkdir -p ~/.vim
asdf plugin add nodejs || true
asdf install nodejs 17.9.0 || true
asdf global nodejs 17.9.0 || true
ln -fs ~/src/dotfiles/vimrc ~/.vimrc
ln -fs ~/src/dotfiles/vim-ftplugin ~/.vim/ftplugin
sudo apt install -y vim-gtk
# PlugInstall

)
