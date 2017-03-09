
#!/usr/bin/env bash
docker run --name jenkins \
    --rm -ti \
    -p 8080:8080 -p 50000:50000 \
    -v $(pwd)/home:/var/jenkins_home \
    jenkins:2.32.1-alpine

#    -v $(pwd)/home:/var/jenkins_home \
