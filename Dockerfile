FROM ubuntu:23.04
WORKDIR /var/www
RUN apt-get update \
    && apt-get install -y \
        net-tools \
        iputils-ping \
        # netcat-openbsd \
    && apt-get install -y \
        redis \
        nginx \
        # postgresql \
        # mysql-server \
    && apt-get install -y \
        php8.1 \
        php8.1-fpm \
        php8.1-mysql \
        php8.1-pgsql \
        php8.1-mongodb \
        php8.1-mbstring \
        php8.1-zip \
        php8.1-xml \
        php8.1-curl \
        php8.1-gd \
        php8.1-bcmath \
        php8.1-gmp \
        php8.1-redis \
        php8.1-intl \
        php8.1-xdebug

# @docs
# @link https://hub.docker.com/_/ubuntu
#
# Install kafka module
# apt-get install librdkafka-dev php8.1-dev php-pear
# pecl install rdkafka
# echo "extension=rdkafka.so" > /etc/php/8.1/mods-available/kafka.ini
# ln -s /etc/php/8.1/mods-available/kafka.ini /etc/php/8.1/cli/conf.d/20-kafka.ini
# ln -s /etc/php/8.1/mods-available/kafka.ini /etc/php/8.1/fpm/conf.d/20-kafka.ini
