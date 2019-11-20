#! /bin/bash

if [[ "$(which ruby)" == "" ]]; then
    sudo apt install ruby ruby-dev
fi

sudo gem install travis