#!/bin/bash

mkdir -p /root/certs && cd /root/certs

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx-selfsigned.key -out nginx-selfsigned.crt -subj "/C=FR/ST=IDF/L=LEHAVRE/O=42/OU=42/CN=rtijani.42.fr/UID=rtijani"


chmod 600 nginx-selfsigned.key

chmod 600 nginx-selfsigned.crt

exec "nginx" "-g" "daemon off;"
