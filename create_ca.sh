#!/bin/bash

openssl req -x509 -config ca.cnf -days 36500 -newkey rsa:4096 -sha512 -nodes -out ca.crt -outform PEM
touch index.txt
echo 01 > serial.txt
