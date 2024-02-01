#!/bin/sh

DIR=$(dirname $(readlink -f $0))
echo $DIR
cd $DIR

docker stop filebrowser-caddy-container
docker rm filebrowser-caddy-container

#     --sysctl net.ipv6.conf.all.disable_ipv6=1 \


docker run -d -p 3071:80 \
    -v $PWD/Caddyfile:/etc/caddy/Caddyfile \
    -v $PWD/../www-root/shared:/usr/share/caddy \
    -v $PWD/data:/data \
    --name filebrowser-caddy-container \
    --restart always \
    caddy:2.6.2-alpine