#! /bin/bash

VERSION="1.2.0"
ARM_V7_URL="https://github.com/slackhq/nebula/releases/download/v${VERSION}/nebula-linux-arm-7.tar.gz"
ARM_64_URL="https://github.com/slackhq/nebula/releases/download/v${VERSION}/nebula-linux-arm64.tar.gz"
LINUX_64_URL="https://github.com/slackhq/nebula/releases/download/v${VERSION}/nebula-linux-amd64.tar.gz"
MODE="$1"
URL=""

if [[ "$MODE" == "armv7" ]]; then
    URL="$ARM_V7_URL"
elif [[ "$MODE" == "arm64" ]]; then
    URL="$ARM_64_URL"
elif [[ "$MODE" == "amd64" ]]; then
    URL="$LINUX_64_URL"
else
    echo "[ERROR] invalid mode, must be one of: armv7, arm64, amd64"
    exit 1
fi

# do amd64 stuff
wget -O nebula.tar.gz "$LINUX_64_URL"
tar zxvf nebula.tar.gz
sudo cp nebula /usr/bin
sudo cp nebula-cert /usr/bin
rm nebula nebula-cert nebula.tar.gz