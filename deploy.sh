#!/bin/bash
# @docs https://docs.docker.com/engine/reference/commandline/container_run/

image="zlabwork/php-dev:20240204-1707040335"

docker run --name zlabwork-service \
    -d \
    -it \
    -v ./:/app \
    -v /var/shared:/var/shared \
    -p 8080:80 \
    $image
