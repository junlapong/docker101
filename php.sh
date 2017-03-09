#!/bin/bash

echo "php"

docker run --name php \
    --rm -it \
    -p 80:80 \
    -v /Users/junlapong/git-space/junlapong.github.io:/www:ro \
    php:5.6-alpine -S 0.0.0.0:80 -t /www
