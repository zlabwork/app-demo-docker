#!/bin/bash
# @docs https://docs.docker.com/engine/reference/commandline/container_run/

DOCKER_IMAGE="zlabwork/php-dev:20240315-1710518125"
DOCKER_NAME="dev"

docker run --name $DOCKER_NAME \
    -itd \
    -v ./www:/app \
    -v ./docs/nginx/conf.d:/etc/nginx/conf.d \
    -v /var/shared:/var/shared \
    -p 8080:8080 \
    $DOCKER_IMAGE

# docker exec $DOCKER_NAME chroot --userspec=apache:apache / ls /
docker exec $DOCKER_NAME service php8.2-fpm start
docker exec $DOCKER_NAME service nginx start
