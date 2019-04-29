
# Jenkins

## WAR file

The Web application ARchive (WAR) file version of Jenkins can be installed on any operating system or platform that supports Java.

### To download and run the WAR file version of Jenkins:

1. Download the latest stable Jenkins WAR file to an appropriate directory on your machine.
2. Open up a terminal/command prompt window to the download directory.
3. Run the command `java -jar jenkins.war`
4. Browse to http://localhost:8080 and wait until the Unlock Jenkins page appears.
5. Continue on with the [Post-installation setup wizard](https://jenkins.io/doc/book/installing/#setup-wizard).

### Notes:

You can change the port by specifying the `--httpPort` option when you run the `java -jar jenkins.war` command. For example, to make Jenkins accessible through port 9090, then run Jenkins using the command:

```
java -jar jenkins.war --httpPort=9090
```

## Docker
https://hub.docker.com/_/jenkins/

```
docker run --name jenkins --rm -ti -p 8080:8080 -p 50000:50000 -v $(pwd)/home:/var/jenkins_home jenkins:2.32.1-alpine
```
