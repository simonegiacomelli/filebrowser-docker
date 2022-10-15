#!/bin/bash

DIR=$(dirname $(readlink -f $0))
echo $DIR
cd $DIR

docker stop filebrowser-caddy-container
docker rm filebrowser-caddy-container



docker run -d -p 3071:80 \
    -v $PWD/Caddyfile:/etc/caddy/Caddyfile \
    -v $PWD/../www-root/shared:/usr/share/caddy \
    -v $PWD/data:/data \
    --name filebrowser-caddy-container \
    --sysctl net.ipv6.conf.all.disable_ipv6=1 \
    caddy:2.6.2-alpine