junlapong/alpine-mariadb
========================

```
docker build -t junlapong/alpine-mariadb .

docker run --name mariadb -p 4306:3306 junlapong/alpine-mariadb

docker run -it \
       -v $(pwd)/data:/var/lib/mysql \
       -e MYSQL_DATABASE=db \
       -e MYSQL_USER=user \
       -e MYSQL_PASSWORD=pass \
       junlapong/alpine-mariadb

docker logs -f [CONTAINER NAME OR ID]

docker exec -it [CONTAINER NAME OR ID] /bin/sh
```

launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist