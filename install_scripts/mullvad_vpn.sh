#! /bin/bash

VERSION="2020.6"

DEB_FILE="https://github.com/mullvad/mullvadvpn-app/releases/download/${VERSION}/MullvadVPN-${VERSION}_amd64.deb"
SIG_FILE="https://github.com/mullvad/mullvadvpn-app/releases/download/${VERSION}/MullvadVPN-${VERSION}_amd64.deb.asc"

wget "$DEB_FILE"
wget "$SIG_FILE"

gpg --verify "MullvadVPN-${VERSION}_amd64.deb.asc"

if [[ "$?" != "0" ]]; then
	echo "[ERROR] verification of file signature failed"
	exit 1
fi

sudo dpkg -i "MullvadVPN-${VERSION}_amd64.deb"
