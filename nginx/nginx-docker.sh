#!/usr/bin/env bash

echo "Start... nginx-container"

docker run --name nginx-container \
  --rm -ti \
  -v $(pwd):/var/www:ro \
  -v $(pwd)/conf/nginx.conf:/etc/nginx/nginx.conf:ro \
  -p 80:80 nginx:alpine

#  -v /etc/localtime:/etc/localtime \

# docker exec -it nginx-container /bin/sh