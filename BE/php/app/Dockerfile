ARG PHP_VERSION=7.2
FROM php:${PHP_VERSION}-fpm-alpine

### use chinese proxy
ARG USE_CHINA_PROXY=False
RUN if [ ${USE_CHINA_PROXY} = True ]; then \
   sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
;fi

### install php base extension
### linux-headers is for grpc
RUN apk add bash  git openssh \
        gcc g++ autoconf make \
        zlib zlib-dev \
        linux-headers \  
    &&  docker-php-ext-install mbstring pdo pdo_mysql mysqli opcache tokenizer 

### install composer
RUN php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

ARG COMPOSER_PUID=1000
ARG COMPOSER_PGID=1000

RUN addgroup -g ${COMPOSER_PGID} composer
RUN adduser -u ${COMPOSER_PUID} -D -G composer composer

RUN if [ ${USE_CHINA_PROXY} = True ]; then \
    composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
;fi


### install gd
ARG INSTALL_GD=False
RUN if [ ${INSTALL_GD} = True ]; then \
   apk add --update --no-cache\
        freetype \
        freetype-dev \
        libpng \
        libpng-dev \
        libjpeg-turbo \
        libjpeg-turbo-dev \
    && docker-php-ext-configure gd \
        --with-jpeg-dir=/usr/include/ \
        --with-freetype-dir=/usr/include/ \
    &&  docker-php-ext-install -j$(nproc) gd \
    && apk del \
        freetype-dev \
        libpng-dev \
        libjpeg-turbo-dev \
;fi

### install redis 
ARG INSTALL_REDIS=False
ARG REDIS_VERSION=5.1.1
RUN if [ ${INSTALL_REDIS} = True ]; then \
    pecl install redis-${REDIS_VERSION} \
    && docker-php-ext-enable redis \
;fi

### install memcached
ARG INSTALL_MEMCACHED=False
ARG MEMCACHED_VERSION=5.1.1
RUN if [ ${INSTALL_MEMCACHED} = True ]; then \
    apk add --update --no-cache\
        libmemcached-dev \
    && pecl install igbinary \
    && pecl install  memcached-${MEMCACHED_VERSION} \
    && docker-php-ext-enable igbinary memcached \
;fi


### install yac 
ARG INSTALL_YAC=False
RUN if [ ${INSTALL_YAC} = True ]; then \
    pecl install yac \
    && docker-php-ext-enable yac  \
;fi


### install xdebug 
ARG INSTALL_XDEBUG=False
ARG XDEBUG_VERSION=2.8.1
RUN if [ ${INSTALL_XDEBUG} = True ]; then \
    pecl install xdebug-${XDEBUG_VERSION} \
    && docker-php-ext-enable xdebug \
;fi

### install grpc 
ARG INSTALL_GRPC=False
RUN if [ ${INSTALL_GRPC} = True ]; then \
    pecl install grpc \
    && docker-php-ext-enable grpc \
;fi

ADD php.ini /usr/local/etc/php/conf.d
ADD site.pool.conf /usr/local/etc/php-fpm.d

# clean cache
RUN rm /var/cache/apk/*

USER composer

WORKDIR /var/www


