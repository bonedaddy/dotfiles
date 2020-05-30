#! /bin/bash

# installs trilium
# for more information on trilium see
#       https://github.com/zadam/trilium

# options are server, or desktop
INSTALL_MODE="$1"
INSTALL_VERSION="0.42.3"
INSTALL_BASE_URL_DESKTOP="https://github.com/zadam/trilium/releases/download/v${INSTALL_VERSION}/trilium_${INSTALL_VERSION}_amd64.deb"
INSTALL_BASE_URL_SERVER="https://github.com/zadam/trilium/releases/download/v${INSTALL_VERSION}/trilium-linux-x64-server-${INSTALL_VERSION}.tar.xz"
INSTALL_SERVER_DIR="$HOME/Programs"

if [[ "$INSTALL_MODE" == "" ]]; then
	INSTALL_MODE="desktop"
fi

if [[ ! -d "$INSTALL_SERVER_DIR" ]]; then
	mkdir "$INSTALL_SERVER_DIR"
fi


if [[ "$INSTALL_MODE" == "desktop" ]]; then
        wget -O trilium.deb "$INSTALL_BASE_URL_DESKTOP"
	sudo dpkg -i trilium.deb
	rm trilium.deb
elif [[ "$INSTALL_MODE" == "server" ]]; then
	wget -O trilium-server.tar.xz "$INSTALL_BASE_URL_SERVER"
	xz -d trilium-server.tar.xz
	tar xvf trilium-server.tar
	mv trilium-linux-x64-server  "$INSTALL_SERVER_DIR"
#	rm -rf trilium-linux-x64-server
	rm trilium-server.tar
	rm trilium-server.tar.xz 
elif [[ "$INSTAL_MODE"  == "manual" ]]; then
	# install deps
	sudo apt install libpng16-16 libpng-dev pkg-config autoconf libtool build-essential nasm libx11-dev libxkbfile-dev -y
	git clone https://github.com/zadam/trilium
	cd trilium && git checkout "v${INSTALL_VERSION}"
	npm install
else
        echo "[ERROR] invalid mode, must be desktop, server, manual"
        exit 1
fi
