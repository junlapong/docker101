#!/bin/bash

docker run --name oracle-xe-11g \
    -it \
    -e 'ORACLE_ALLOW_REMOTE=true' \
    -p 1521:1521 \
    wnameless/oracle-xe-11g


# -v $(pwd)/data:/var/opt/data \

# docker exec -it oracle-xe-11g /bin/bash