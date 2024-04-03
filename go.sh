#!/usr/bin/env bash

set -ex

version="go1.22.2"
current="$(go version | cut -d ' ' -f 3)"

if [[ "$current" != "$version" ]]; then
	archive="${version}.linux-amd64.tar.gz"
	(
		cd /tmp
		curl -LO "https://go.dev/dl/$archive"
	)
	sudo rm -rf /usr/local/go
	sudo tar -C /usr/local -xzf "/tmp/$archive"
else
	echo "the installed go is already the specified version: $current"
fi

go install golang.org/x/tools/...@latest
go install golang.org/x/tools/gopls@latest
go install golang.org/x/exp/cmd/gorelease@latest
go install github.com/cosmtrek/air@latest
go install github.com/segmentio/golines@latest
