#!/bin/sh

# Backblaze B2 configuration variables
B2_ACCOUNT="AAA"
B2_KEY="BBB"
B2_BUCKET="CCC"
B2_DIR="backups"

# Local directory to backup
LOCAL_DIR="/home/DDD/backups"

# GPG key (last 8 characters)
ENC_KEY="EEEEEEEE"
SGN_KEY="FFFFFFFF"
export PASSPHRASE="GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG"
export SIGN_PASSPHRASE="HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH" 

# Remove files older than 90 days
duplicity \
 --sign-key $SGN_KEY --encrypt-key $ENC_KEY \
 remove-older-than 90D --force \
 b2://${B2_ACCOUNT}:${B2_KEY}@${B2_BUCKET}/${B2_DIR}

# Perform the backup, make a full backup if it's been over 30 days
duplicity \
 --sign-key $SGN_KEY --encrypt-key $ENC_KEY \
 --full-if-older-than 30D \
 ${LOCAL_DIR} b2://${B2_ACCOUNT}:${B2_KEY}@${B2_BUCKET}/${B2_DIR}

# Cleanup failures
duplicity \
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
