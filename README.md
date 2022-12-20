## start & stop
```bash
docker-compose up -d
docker-compose down
docker-compose -f docker-compose.yaml up -d
```


## logs
```bash
docker logs app-web -f --tail 5
docker-compose logs -f --tail 5
```


## tools
```bash
apt install net-tools iputils-ping
```


## install php ext in php:8.1.12-fpm-alpine
```shell
# connect to the container
docker exec -it app-php sh
```
```shell
# execute in the container
apk add libpq-dev \
&& docker-php-ext-install -j$(nproc) pdo_pgsql pdo_mysql exif gd intl soap
```
```shell
# restart the container
docker restart app-php
```


## docker-compose docs
https://github.com/compose-spec/compose-spec/blob/master/spec.md  
https://docs.docker.com/samples/wordpress/  
https://docs.docker.com/compose/  


## nginx 参考
https://symfony.com/doc/current/setup/web_server_configuration.html#nginx  
https://laravel.com/docs/8.x/deployment#nginx  
https://docs.nextcloud.com/server/latest/admin_manual/installation/nginx.html?highlight=nginx  
