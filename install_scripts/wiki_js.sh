#! /bin/bash

INSTALL_DIR="$1"
DB_MODE="sqlite"
wget https://github.com/Requarks/wiki/releases/download/2.2.51/wiki-js.tar.gz
mkdir "$1/wiki"
tar xzf wiki-js.tar.gz -C "$1/wiki"
cd "$1/wiki"
mv config.sample.yml config.yml
if [[ "$DB_MODE" != "sqlite" ]]; then
	echo "please consult https://docs.requarks.io/install/linux for additional install information"
	exit 0
fi
npm rebuild sqlite3
node server
