IBM WebSphere Application Server traditional for Developers image
=================================================================

The images in this repository contain IBM WebSphere Application Server traditional for Developers. The scripts used to build the images can be found on GitHub. See the license section below for restrictions relating to the usage of this image.

# Images
There are multiple images available in this repository.

The install image contains just the IBM WebSphere Application Server for Developers without the profile. With this image, when the container is started the profile is created and the server is started.

The profile image contains the IBM WebSphere Application Server for Developers with the profile already created. With this image, when the container is started the server is started.

The profile image is also tagged with latest.

There are also corresponding image tags that contain the version number of the WebSphere Application Server release contained within the image. These are primarily to signpost the current version in use and will be replaced when a subsequent release becomes available. Consequently, only use these tags if you explicitly want your build to break when a new release becomes available.

# Usage
## Install image
The `ibmcom/websphere-traditional:install` Docker image contains IBM WebSphere Application Server traditional for Developers and can be started by:

### Running the image using default values:
```
docker run --name test -h test -p 9043:9043 -p 9443:9443 -d \
  ibmcom/websphere-traditional:install
```

### Running the image by passing values for the environment variables:
```
docker run --name test -h test -e HOST_NAME=test -p 9043:9043 -p 9443:9443 -d \
  -e PROFILE_NAME=AppSrv02 -e CELL_NAME=DefaultCell02 -e NODE_NAME=DefaultNode02 \
  ibmcom/websphere-traditional:install
```

```
PROFILE_NAME (optional, default is 'AppSrv01')
CELL_NAME (optional, default is 'DefaultCell01')
NODE_NAME (optional, default is 'DefaultNode01')
HOST_NAME (optional, default is 'localhost')
```

## Profile image
The `ibmcom/websphere-traditional:profile` Docker image contains IBM WebSphere Application Server traditional for Developers with the profile already created and can be started by:

### Running the image using default values:
```
docker run --name test -h test -p 9043:9043 -p 9443:9443 -d \
   ibmcom/websphere-traditional:profile
```

### Running the image by passing values for the environment variables:
```
docker run --name test -h test -e UPDATE_HOSTNAME=true -p 9043:9043 -p 9443:9443 -d \
  ibmcom/websphere-traditional:profile
```

`UPDATE_HOSTNAME` (optional, set to 'true' if the hostname should be updated from the default of 'localhost' to match the hostname allocated at runtime)

### Admin console
In both cases a secure profile is created with an admin user ID of `wsadmin` and a generated password. The generated password can be retrieved from the container using the following command:

```
docker exec test cat /tmp/PASSWORD
```

It is also possible to specify a password when the container is run by mounting a file containing the password to /tmp/PASSWORD. For example:
```
docker run --name test -h test -v $(pwd)/PASSWORD:/tmp/PASSWORD \
  -p 9043:9043 -p 9443:9443 -d ibmcom/websphere-traditional:install
```

Once the server has started, you can access the admin console at [https://localhost:9043/ibm/console/logon.jsp](https://localhost:9043/ibm/console/logon.jsp)

If you are running in Docker Toolbox, use the value returned by docker-machine ip instead of localhost.
