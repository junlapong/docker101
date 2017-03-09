#!/usr/bin/env bash

echo "nginx localhost:$1"

docker run --rm -ti \
    -p $1:80 \
    -v $2:/usr/share/nginx/html:ro \
    nginx:alpine

# docker exec -it nginx-container /bin/sh
