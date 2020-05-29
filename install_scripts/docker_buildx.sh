#! /bin/bash

# installs docker buildx
DOWNLOAD_URL="https://github.com/docker/buildx/releases/download/v0.4.1/buildx-v0.4.1.linux-amd64"
if [[ ! -d "$HOME/.docker/cli-plugins" ]]; then
	mkdir "$HOME/.docker/cli-plugins"
fi
wget -O docker-buildx "$DOWNLOAD_URL"
chmod a+x docker-buildx
cp docker-buildx "$HOME/.docker/cli-plugins"

