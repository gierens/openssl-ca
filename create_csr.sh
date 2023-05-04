#!/bin/bash

NAME=$1
if [ -z "$NAME" ]; then
    echo "Usage: $0 <name>"
    exit 1
fi
openssl req -config $NAME.cnf -newkey rsa -nodes -out $NAME.csr -outform PEM
