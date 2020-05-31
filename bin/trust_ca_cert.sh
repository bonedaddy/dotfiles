#! /bin/bash

# useful for trusting self-signed certs
CERT_PATH="$1"
if [[ "$CERT_PATH" == "" ]]; then
	echo "[ERROR] first arg must be cert to add"
	exit 1
fi
if [[ ! -d /usr/share/ca-certificates/extra ]]; then
	sudo mkdir /usr/share/ca-certificates/extra
fi

sudo cp "$CERT_PATH" /usr/share/ca-certificates/extra

sudo dpkg-reconfigure ca-certificates
