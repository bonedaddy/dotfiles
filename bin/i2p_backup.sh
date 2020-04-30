#! /bin/bash

# used to backup an i2p router enabled in service mode
BACKUP_DIR="$1"

sudo rsync -avz /var/lib/i2p "$BACKUP_DIR"

