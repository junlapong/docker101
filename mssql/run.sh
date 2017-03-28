#!/bin/bash

docker run -it \
    -e 'ACCEPT_EULA=Y' \
    -e 'SA_PASSWORD=P@ssw0rd' \
    -p 1433:1433 \
    -v $(pwd)/data:/var/opt/mssql \
    microsoft/mssql-server-linux