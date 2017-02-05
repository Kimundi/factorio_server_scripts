#!/bin/bash
set -e

mkdir -p servers

echo "Select server to manage"
select S in $(ls servers; echo "<new>"); do
    SERVER_NAME=$S
    break
done

echo "Select version to create/update with"
select F in $(ls tars | sort -r); do
    FILENAME=tars/$F
    break
done

SERVER_PATH="servers/$SERVER_NAME"

if [[ $SERVER_NAME == "<new>" ]]; then
    echo "Enter name"
    read NAME
    echo "Creating..."
    SERVER_NAME=$NAME
    SERVER_PATH="servers/$SERVER_NAME"
    mkdir -p "$SERVER_PATH"
    tar -xzf $FILENAME -C $SERVER_PATH
else
    echo "Updating..."
    tar -xzf $FILENAME -C $SERVER_PATH
fi

tree . -L 4
