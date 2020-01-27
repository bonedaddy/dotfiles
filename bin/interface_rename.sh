#! /bin/bash

echo "enter interface to rename: "
read -r SOURCE_INT
echo "enter new interface name: "
read -r DEST_INT

sudo ifconfig "$SOURCE_INT" down
sudo ip link set "$SOURCE_INT" name "$DEST_INT"
sudo ifconfig "$DEST_INT" up

