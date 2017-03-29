#!/usr/bin/env bash

echo "Start..."

docker run --name mariadb \
       -d \
       -e MYSQL_RANDOM_ROOT_PASSWORD=1 \
       -e MYSQL_DATABASE=db \
       -e MYSQL_USER=user \
       -e MYSQL_PASSWORD=pass \
       junlapong/alpine-mariadb

#-v $(pwd)/data:/var/lib/mysql \
#-v $(pwd)/scripts/run.sh:/scripts/run.sh:ro \

echo docker exec -it mariadb /bin/bash