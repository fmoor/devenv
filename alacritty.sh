#!/usr/bin/env bash

set -ex

version="v0.10.1"

sudo apt update
sudo apt install -y \
	cmake \
	libfontconfig1-dev \
	libfreetype6-dev \
	libxcb-xfixes0-dev \
	libxkbcommon-dev \
	pkg-config \
	python3

if [[ ! -d ~/src/.alacritty ]]; then
	git clone https://github.com/alacritty/alacritty.git ~/src/.alacritty
fi

(
	cd ~/src/.alacritty
	git fetch
	git checkout "$version"

	rustup override set stable
	rustup update stable
	cargo build --release

	# terminfo
	sudo tic -xe alacritty,alacritty-direct extra/alacritty.info

	# desktop entry
	sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
	sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
	sudo desktop-file-install extra/linux/Alacritty.desktop
	sudo update-desktop-database

	# config file
	ln -fs ~/src/dotfiles/alacritty.yml ~/.alacritty.yml

	# make alacritty the default terminal
	sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(which alacritty) 50

)

(
	cd /tmp
	curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/UbuntuMono.zip
	unzip /tmp/UbuntuMono.zip -d ~/.local/share/fonts/
)
