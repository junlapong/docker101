Docker 101
==========

```
docker pull <REPOSTIROY:TAG>

docker run --rm <REPOSTIROY:TAG> COMMAND [ARGS..]
docker run --name <NAME> --rm -it <REPOSTIROY:TAG> /bin/sh
docker run --name <NAME> -d <REPOSTIROY:TAG> /bin/sh

docker exec -it <CONTAINER ID> /bin/sh

docker info
docker ps -a
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker container prune

docker images
docker rmi <IMAGE ID>
docker rmi $(docker images -qf "dangling=true")

docker volume ls -qf dangling=true
docker volume rm $(docker volume ls -qf "dangling=true")

docker inspect IMAGE_ID
docker inspect -f {{.Name}} - {{.NetworkSettings.IPAddress }} $(docker ps -aq)

docker network ls
```

## Export docker container to file
```
docker export -o <container-name.tar> <CONTAINER ID>
```

## Import file to create a filesystem image
```
docker import [OPTIONS] file|URL|- [REPOSITORY[:TAG]]
```

## Save docker image to file
```
docker save -o <image-name.tar> <IMAGE ID>
```

## Load docker image from file
```
docker load -i <image-name.tar>
```

## Tag image
```
docker tag <IMAGE ID> <REPOSTIROY:TAG>
```
