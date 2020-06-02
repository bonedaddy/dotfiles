#! /bin/bash

NUM_HOSTS="$1"
COUNT=0

if [[ "$NUM_HOSTS" == "" ]]; then
    NUM_HOSTS="1"
fi


while true; do
    if [[ "$COUNT" == "$NUM_HOSTS" ]]; then
        break
    fi
    echo "enter host name, ie foobar"
    read -r NAME
    echo "enter ip, ie 127.0.0.1"
    read -r IP
    echo "enter groups, ie home,ssh"
    read -r GROUPS
    nebula-cert sign -name "$NAME" -ip "$IP" -groups "$GROUPS"
    let COUNT=COUNT+1
done