#! /bin/bash

# installs nodejs 12 (lts)

UPGRADE="$1"

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

if [[ "$UPGRADE" == "--upgrade=yes" ]]; then
    sudo apt-get install --only-upgrade nodejs
    sudo npm install -g npm
else
    sudo apt-get install -y nodejs
fi
