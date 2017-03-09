#!/bin/bash

echo "nginx localhost:8088"

docker run --name nginx \
    --rm -it \
    -p 8088:80 \
    -v /Users/junlapong/git-space/junlapong.github.io:/usr/share/nginx/html:ro \
    nginx:alpine
