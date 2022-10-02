#!/usr/bin/env bash

set -ex

(

sudo apt install -y \
	bat \
	byobu \
	curl \
	direnv \
	ffmpeg \
	htop \
	jq \
	net-tools \
	ripgrep \
	tmux \
	tree \
	xclip 

sudo ln -fs /usr/bin/batcat /usr/bin/bat

curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh > ~/.git-prompt.sh
mkdir -p ~/.byobu
ln -fs ~/src/dotfiles/tmux ~/.byobu/.tmux.conf
ln -fs ~/src/dotfiles/bashrc ~/.bashrc
ln -fs ~/src/dotfiles/gitconfig ~/.gitconfig
ln -fs ~/src/dotfiles/gitignore_global ~/.gitignore_global
ln -fs ~/src/dotfiles/global-tool-versions ~/.tool-versions

# python dependencies used by asdf
sudo apt-get install -y build-essential gdb lcov pkg-config \
	libbz2-dev libffi-dev libgdbm-dev libgdbm-compat-dev liblzma-dev \
	libncurses5-dev libreadline6-dev libsqlite3-dev libssl-dev \
	lzma lzma-dev tk-dev uuid-dev zlib1g-dev


if [[ ! -d ~/.asdf ]]; then
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf
fi

(
	cd ~/.asdf
	git checkout v0.10.0
)

source $HOME/.asdf/asdf.sh
asdf plugin-add direnv || true
asdf direnv setup --shell bash --version latest

(
if [[ ! -d ~/.fzf ]]; then
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
fi
~/.fzf/install --completion --key-bindings --no-update-rc --no-zsh --no-fish
)

)
