## Start & stop
```bash
docker-compose up -d
docker-compose down
docker-compose -f docker-compose.yaml up -d
```


## Logs
```bash
docker logs app-web -f --tail 5
docker-compose logs -f --tail 5
docker-compose -f docker-compose.kafka.yaml logs -f --tail 5
```


## Tools
```bash
apt install net-tools iputils-ping
```


## Install php ext in php:8.1.12-fpm-alpine
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

## Elasticsearch for dev env
https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#docker-file
```shell
docker run --name es01 -p 9200:9200 -p 9300:9300 \
    -e "discovery.type=single-node" \
    -e "xpack.security.enabled=false" \
    -e "xpack.security.http.ssl.enabled=false" \
    -it elasticsearch:8.5.3
```
```shell
curl -XGET 'http://localhost:9200/' -H 'Content-Type: application/json'
```

## Elasticsearch xpack (https request)
https://www.elastic.co/cn/blog/elasticsearch-security-configure-tls-ssl-pki-authentication
```sh
# Generate /usr/share/elasticsearch/elastic-stack-ca.p12
elasticsearch-certutil ca

# Generate client.p12
elasticsearch-certutil cert --ca ./elastic-stack-ca.p12 -name "CN=something,OU=Consulting Team,DC=mydomain,DC=com"

# Private Key
openssl pkcs12 -in client.p12 -nocerts -nodes > client.key

# Public Certificate
openssl pkcs12 -in client.p12 -clcerts -nokeys  > client.cer

# CA Certificate
openssl pkcs12 -in client.p12 -cacerts -nokeys -chain > client-ca.cer

# Test
curl https://localhost:9200/_xpack/security/_authenticate?pretty \
--key client.key --cert client.cer --cacert client-ca.cer -k -v

curl --user elastic:password https://localhost:9200 \
--key client.key --cert client.cer --cacert client-ca.cer -k -v
```

## Docker-compose docs
https://github.com/compose-spec/compose-spec/blob/master/spec.md  
https://docs.docker.com/samples/wordpress/  
https://docs.docker.com/compose/  


## Nginx 参考
https://symfony.com/doc/current/setup/web_server_configuration.html#nginx  
https://laravel.com/docs/8.x/deployment#nginx  
https://docs.nextcloud.com/server/latest/admin_manual/installation/nginx.html?highlight=nginx  
