# woocommerce-docker
====================

## Docker images
 - https://hub.docker.com/_/wordpress/
 - https://hub.docker.com/_/mariadb/

```
docker-compose up

# check container id
docker ps -a

# access to db host
docker exec -it <DB CONTAINER ID> /bin/bash

# create database
$ mysql -u root -p

MariaDB > create database wordpress;

```

## Open URL
 - http://127.0.0.1:8080/
 - http://127.0.0.1:8080/wp-login.php


## Build
```
docker build -t junlapong/woocommerce .
```

## Run
```
docker run --rm -ti -p 9080:80 --name woocommerce junlapong/woocommerce
```

## Bash
```
docker exec -it woocommerce bin/bash
```

# TODO
change base image to junlapong/alpine-nginx-php7
