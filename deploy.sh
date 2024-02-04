#!/bin/bash
# @docs https://docs.docker.com/engine/reference/commandline/container_run/

DOCKER_IMAGE="zlabwork/php-dev:20240204-1707044243"
DOCKER_NAME="dev"

docker run --name $DOCKER_NAME \
    -d \
    -it \
    -v ./:/app \
    -v /var/shared:/var/shared \
    -v ./docs/docker/conf.d:/etc/nginx/conf.d \
    -p 8080:8080 \
    $DOCKER_IMAGE

# docker exec $DOCKER_NAME chroot --userspec=apache:apache / ls /
docker exec $DOCKER_NAME service php8.1-fpm start
docker exec $DOCKER_NAME service nginx start
