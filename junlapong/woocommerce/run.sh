#!/usr/bin/env bash

echo "Start..."

docker run --name woocommerce \
  --rm -ti \
  -v /etc/localtime:/etc/localtime \
  -v $(pwd)/www/index.php:/var/www/index.php:ro \
  -p 8088:80 \
  junlapong/woocommerce

# docker exec -it woocommerce /bin/bash