#! /bin/bash

# used to backup my laptop to destination directories

BACKUP_DIR="$1"
ROOT_DIR="/home/$(whoami)"

# general backup that ignores hidden directories and node_modules
rsync -avz --exclude "*node_module*" --exclude ".*" --exclude "Code" --exclude "*go*" "$ROOT_DIR" "$BACKUP_DIR"

# backup important hidden directories and files
rsync -avz "$ROOT_DIR/.config" "$ROOT_DIR/.ssh" "$ROOT_DIR/.gitconfig" "$ROOT_DIR/.gnupg" "$ROOT_DIR/.msf4" "/var/lib/i2p" "$BACKUP_DIR"

# backup important system files
rsync -avz "/etc/stubby" /etc/dnsmasq.conf "/media/solidity/DATA/trilium" "/media/solidity/DATA/website-archives" /etc/rkhunter.conf /etc/default/arpon /etc/sysctl.conf /etc/host.conf "$BACKUP_DIR"
