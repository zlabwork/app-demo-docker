#!/bin/bash
# @docs https://docs.docker.com/engine/reference/commandline/login/
# @docs https://docs.docker.com/engine/reference/commandline/image_push/

name="zlabwork/php-dev"
tag=$(date "+%Y%m%d")-$(date "+%s")
echo "$name:$tag"

docker build -t "$name:$tag" -f Dockerfile-debian .
# docker push "$name:$tag"
