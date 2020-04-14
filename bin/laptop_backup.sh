#! /bin/bash

# used to backup my laptop to destination directories

BACKUP_DIR="$1"

rsync -avz --exclude "node_module" --exclude ".*" "/home/$(whoami)" "$BACKUP_DIR"
