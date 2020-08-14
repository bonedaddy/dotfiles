#!/bin/bash

# modified version of https://www.loganmarchione.com/2017/07/backblaze-b2-backup-setup/
# this is modified in that it doesn't require hard coding the gpg  sign and encryption key passphrases
# it also allows the user to specify the b2 bucket, local directory to backup, and optionally the b2 bucket directory to store backups in


function print_help {
    echo "duplicity_b2_backup.sh <b2-bucket> <backup-dir> [b2-bucket-dir]"
    exit 1
}

# Backblaze B2 configuration variables
B2_ACCOUNT="..."
B2_KEY="..."
B2_BUCKET="$1"
B2_DIR="$3"
LOCAL_DIR="$2"
# GPG key (last 8 characters)
ENC_KEY="..."
SGN_KEY="..."

if [[ "$B2_BUCKET" == "" ]]; then
    echo "invalid invocation"
    print_help
fi


if [[ "$LOCAL_DIR" == "" ]]; then
    echo "invalid invocation"
    print_help
fi

if [[ "$B2_DIR" == "" ]]; then
    B2_DIR="backups"
fi

read -s -p "enter gpg key password: " PASSWORD

export PASSPHRASE="$PASSWORD"
export SIGN_PASSPHRASE="$PASSWORD" 

# Remove files older than 90 days
duplicity \
 --progress \
 --sign-key $SGN_KEY --encrypt-key $ENC_KEY \
 remove-older-than 90D --force \
 b2://${B2_ACCOUNT}:${B2_KEY}@${B2_BUCKET}/${B2_DIR}

# Perform the backup, make a full backup if it's been over 30 days
duplicity \
 --progress \
 --sign-key $SGN_KEY --encrypt-key $ENC_KEY \
 --full-if-older-than 30D \
 ${LOCAL_DIR} b2://${B2_ACCOUNT}:${B2_KEY}@${B2_BUCKET}/${B2_DIR}

# Cleanup failures
duplicity \
 --progress \
 cleanup --force \
 --sign-key $SGN_KEY --encrypt-key $ENC_KEY \
 b2://${B2_ACCOUNT}:${B2_KEY}@${B2_BUCKET}/${B2_DIR}

# Show collection-status
duplicity collection-status \
 --sign-key $SGN_KEY --encrypt-key $ENC_KEY \
  b2://${B2_ACCOUNT}:${B2_KEY}@${B2_BUCKET}/${B2_DIR}

# Unset variables
unset B2_ACCOUNT
unset B2_KEY
unset B2_BUCKET
unset B2_DIR
unset LOCAL_DIR
unset ENC_KEY
unset SGN_KEY
unset PASSPHRASE
unset SIGN_PASSPHRASE 
