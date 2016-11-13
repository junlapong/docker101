Docker 101
==========

```
docker rm $(docker ps -a -q)

docker images
docker rmi 2abb3b6fc22c
docker rmi $(docker images -q --filter "dangling=true")

docker volume ls -qf dangling=true
docker volume rm $(docker volume ls -qf dangling=true)

docker inspect IMAGE_ID
docker inspect -f {{.Name}} - {{.NetworkSettings.IPAddress }} $(docker ps -aq)

```
