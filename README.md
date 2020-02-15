# Docker

## Docker-Commands

Shows the current version:

`docker version`

Shows a status of currently running and/or downloaded images etc...:

`docker info`

Starts an nginx container which is exposed in port 80 and maps the port to port 80 in our local machine in interactive mode:

`docker container run -it --publish 80:80 nginx`

`the first 80 is the port you want to use in the local machine the second 80 is the port which is exposed from the container`

Start an nginx container in detached mode:

`docker container run -d -p 8080:80 --name mynginx nginx`

Start an nginx container and enter the container (bash into it):

`docker container run exec -it nginx bash`

Start an nginx container and bind it somewhere on our system:

`docker container run -d -p 8080:80 -v $(pwd):/usr/share/nginx/html --name nginx-website nginx`

Shows the running containers:

`docker container ls`

Shows the running containers (deprecated):

`docker ps`

Shows all of the containers that are on our machine:

`docker container ls -a`

Stop a container:

`docker container stop #id/name`

Delete a container:

`docker container rm #id/name`

Delete a container (force):

`docker container rm #id/name -f`

Delete all containers:

`docker rm $(docker ps -aq)`

Pull nginx image from docker:

`docker pull nginx`

build an image from docker file:

`docker image build -t prince537/nginx-website .`

push an image to dockerhub:

`docker push prince537/nginx-website`

login to dockerhub:

`docker login`

see an image history:

`docker image history $imageName`

inspect an image metadata:

`docker image inspect $imageName`

change tag:

`docker image tag $SOURCE_IMAGE[:TAG] $TARGET_IMAGE[:TAG]`

push owned images to docker hub:

`docker image push $TARGET_IMAGE[:TAG]`

see container logs:

`docker container logs -f $CONTAINER_NAME`

### docker run options

interactive mode:

`-it`

publish a container's port to the host:

`--publish -p`

detached mode:

`-d --detached`

add a name:

`--name`

set an environment variable:

`--env ENV_NAME=value`

bind local storage:

`-v`

deletes container after the work is done:

`--rm`

current directory we are in:

`$(pwd)`

keep watching the logs:

`-f`

## Docker-File

in docker file is just a way of extending another image ("Required"):

`FROM`

create environment variables:

`ENV ENV_NAME`

set the working directory in the container:

`WORKDIR /src/to/file`

copy from current machine to docker container:

`COPY ./from ./to`

run a command in the container:

`RUN command (npm install)`

expose a port from within the container:

`EXPOSE PORTNUMBER (3000)`

send a custom command to the container ("Required"):

`CMD ["npm", "start"]`

build and run a composed docker file:

`docker-compose up`
