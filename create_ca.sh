#!/bin/bash

if [ -f ca.crt ]; then
    echo "CA already exists, delete ca.crt if you want to create a new one."
    exit 1
fi

rm -f index.txt serial.txt
openssl req -x509 -config ca.cnf -days 36500 -newkey rsa:4096 -sha512 -nodes -out ca.crt -outform PEM
touch index.txt
echo 01 > serial.txt
