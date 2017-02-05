#!/bin/bash
set -e

SLEEP_TIME=5

MYURL=`cat myurl.txt`

while true; do
    OLD_IP=$IP
    IP=`dig +short $MYURL @resolver1.opendns.com`
    printf "OLD IP: %s\\n" $OLD_IP
    printf "    IP: %s\\n" $IP

    if [[ ! $OLD_IP == $IP ]]; then
        echo Unequal!
    fi

    sleep $SLEEP_TIME
done
