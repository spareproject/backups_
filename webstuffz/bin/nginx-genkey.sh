#!/bin/env bash
openssl req -x509 -nodes -newkey rsa:4096 -sha512 -out nginx.pem -keyout nginx.key

