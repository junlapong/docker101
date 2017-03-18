#!/usr/bin/env bash

echo "Start... > http://localhost:8080/"

docker run --name woocommerce \
  --rm -ti \
  -p 8088:80 \
  junlapong/woocommerce


#  -v /etc/localtime:/etc/localtime \
#  -v $(pwd)/www/index.php:/var/www/index.php:ro \
# docker exec -it woocommerce /bin/bash