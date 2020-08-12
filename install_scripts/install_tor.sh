#! /bin/bash


VERSION="0.4.3.6"
wget "https://dist.torproject.org/tor-${VERSION}.tar.gz"
tar zxvf "tor-${VERSION}.tar.gz"
cd "tor-${VERSION}"
./configure
make -j$(nproc)
sudo make install -j$(nproc)