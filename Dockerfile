# Container image that runs your code
FROM ubuntu:16.04
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get clean -y
RUN apt-get install -y wget

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
