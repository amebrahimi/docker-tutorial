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

current directory we are in:

`$(pwd)`

## Docker-File

`FROM` in docker file is just a way of extending another image.