#! /bin/bash

# helper script to retrieve uuid of a disk

sudo blkid "$1" | awk '{print $2}' | awk -F '=' '{print $2}' | tr -d '"'