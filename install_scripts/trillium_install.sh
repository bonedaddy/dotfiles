#! /bin/bash

# installs trilium
# for more information on trilium see
#       https://github.com/zadam/trilium

# options are server, or desktop
INSTALL_MODE="desktop"
INSTALL_VERSION="0.42.3"
INSTALL_BASE_URL_DESKTOP="https://github.com/zadam/trilium/releases/download/v${INSTALL_VERSION}/trilium_${INSTALL_VERSION}_amd64.deb"
INSTALL_BASE_URL_SERVER="https://github.com/zadam/trilium/releases/download/v${INSTALL_VERSION}/trilium-linux-x64-server-${INSTALL_VERSION}.tar.xz"

if [[ "$INSTALL_MODE" == "desktop" ]]; then
        wget -O trilium.deb "$INSTALL_BASE_URL_DESKTOP"
	sudo dpkg -i trilium.deb
	rm trilium.deb
elif [[ "$INSTALL_MODE" == "server" ]]; then
        echo "server"
else
        echo "[ERROR] invalid mode, must be desktop or server"
        exit 1
fi
