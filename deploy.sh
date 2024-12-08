#!/bin/bash
# @docs https://docs.docker.com/engine/reference/commandline/container_run/

DOCKER_IMAGE="zlabwork/php-dev:20240315-1710518125"
DOCKER_NAME="dev"

docker run --name $DOCKER_NAME \
    -itd \
    -v ./docs/nginx/conf.d:/etc/nginx/conf.d \
    -v /private/var/data/www:/app \
    -v /private/var/data/log:/var/log/nginx \
    -p 8080:8080 \
    $DOCKER_IMAGE

# docker exec $DOCKER_NAME chroot --userspec=apache:apache / ls /
docker exec $DOCKER_NAME service php8.2-fpm start
docker exec $DOCKER_NAME service nginx start
