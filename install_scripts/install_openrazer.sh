#! /bin/bash

# used to install openrazer synapse library

# this installs the drivers
sudo add-apt-repository ppa:openrazer/stable
sudo apt update -y
sudo apt install openrazer-meta
# this install the gui configuration tool
sudo add-apt-repository ppa:polychromatic/stable
sudo apt install polychromatic

