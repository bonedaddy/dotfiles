#! /bin/bash
INSTALL_DEPENDENCIES="false"
VERSION="3.4.3"
URL="https://github.com/polybar/polybar/releases/download/${VERSION}/polybar-${VERSION}.tar"
if [[ "$INSTALL_DEPENDENCIES" == "true" ]]; then
	sudo apt install build-essential clang-7 cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb-xkb-dev xcb-proto libxcb-image0 libxcb-ewmh2  libxcb-cursor0 libxcb-xrm0 libxcb-xkb1 libasound2 libpulse0 libmpdclient2 -y
sudo apt install build-essential git cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev -y
fi
wget "$URL"
tar xvf "polybar-$VERSION.tar"
(cd "polybar" ; mkdir build ; cd build ; cmake .. ; make -j$(nproc) ; sudo make install)
rm -rf polybar "polybar-$VERSION.tar"
