#! /bin/bash

# used to backup the bitwarden_rs data directory

# the directory where bitwarden stores its files
SOURCE_DIR="$1"
# the destination directory to backup to
DEST_DIR="$2"

# backup the sqlite data
sudo sqlite3 "$SOURCE_DIR/db.sqlite3" ".backup $DEST_DIR/bitrsdb_backup.sqlite3"

# backup the attachments folder if exists
if [[ -d "$SOURCE_DIR/attachments" ]]; then
    sudo rsync --recursive "$SOURCE_DIR/attachments" "$DEST_DIR"
fi