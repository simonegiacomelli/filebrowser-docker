#!/bin/bash

DIR=$(dirname $(readlink -f $0))
echo $DIR
cd $DIR

while true; do
    mc -e Caddyfile
    #caddy reload --config /etc/caddy/Caddyfile
    ./docker-run.sh
    sleep 1s
    docker logs filebrowser-caddy-container
    read -p "Press enter to continue"
done