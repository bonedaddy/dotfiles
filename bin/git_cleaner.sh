#! /bin/bash

# used to purge a file from a git tree

REPO_PATH="$1"
# once in the repo root the path to the file to remove
FILE_PATH="$2"

cd "$REPO_PATH" && git filter-branch --force --index-filter "git rm --cached --ignore-unmatch $FILE_PATH" --prune-empty
