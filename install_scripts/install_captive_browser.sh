#! /bin/bash

go get -u github.com/FiloSottile/captive-browser
cp $(go env GOPATH)/src/github.com/FiloSottile/captive-browser/captive-browser-ubuntu-chrome.toml ~/.config/captive-browser.toml
