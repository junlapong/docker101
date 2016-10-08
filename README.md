Docker 101
==========

```
docker rm $(docker ps -a -q)
docker images
docker rmi 2abb3b6fc22c
docker inspect -f {{.Name}} - {{.NetworkSettings.IPAddress }} $(docker ps -aq)
```
