#!/bin/bash

openssl req -config server.example.com.cnf -newkey rsa:4096 -sha512 -nodes -out server.example.com.csr -outform PEM
