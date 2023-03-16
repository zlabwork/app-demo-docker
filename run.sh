#!/bin/bash


# https://linux.cn/article-11480-1.html
# service postgresql


# 文档
if [ $# -ge 0 ]; then
  echo "  usage:"
  echo "  ./run.sh build"
  echo "  ./run.sh run"
fi


# 构建的配置文件 Dockerfile
if [ $# -ge 1 ] && [ $1 = build ]; then
  docker build -t dev:full .
fi


# 运行
if [ $# -ge 1 ] && [ $1 = run ]; then
  echo "Starting..." 
  docker run -it \
    --name dev \
    --env-file .env \
    -p 8000:8080 \
    -v /private/var/data/www:/app \
    -v $(pwd)/data:/var/data \
    dev:full bash
  echo "It is completed"
fi
