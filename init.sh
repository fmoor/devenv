#!/usr/bin/env sh

sudo add-apt-repository --yes universe
sudo apt-get --yes update
sudo apt-get --yes install ansible git gpg

ansible-galaxy collection install community.general
ansible-pull \
	-Kv \
	--vault-password-file /tmp/.vault_password \
	--url https://github.com/fmoor/devenv.git \
	base.yml
