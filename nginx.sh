#!/bin/bash

echo "nginx localhost:8080"

docker run --name some-nginx --rm -it -p 8080:80 -v /var/www/html:/usr/share/nginx/html:ro nginx

