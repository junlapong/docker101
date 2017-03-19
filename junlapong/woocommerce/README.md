woocommerce-docker
====================

## Build
```
docker build -t junlapong/woocommerce .
```

## Run
```
docker run --rm -ti -p 8080:80 --name woocommerce junlapong/woocommerce
```

## Bash
```
docker exec -it woocommerce bin/bash
```

## Docker Compose

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

## CyberSource Plugin
 - [Silent Order Post (SA SOP)](https://docs.woocommerce.com/document/cybersource-sop-payment-gateway/)
 - [SOAP Toolkit API](https://docs.woocommerce.com/document/cybersource-payment-gateway/)
