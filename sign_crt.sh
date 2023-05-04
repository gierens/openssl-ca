#!/bin/bash

NAME=$1
if [ -z "$NAME" ]; then
    echo "Usage: $0 <name>"
    exit 1
fi
openssl ca -config ca.cnf -policy signing_policy -extensions signing_req -out $NAME.crt -infiles $NAME.csr
