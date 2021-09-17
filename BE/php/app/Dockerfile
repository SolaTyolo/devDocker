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


### install gd
ARG INSTALL_GD=False
RUN if [ ${INSTALL_GD} = True ]; then \
   apk add freetype \
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

WORKDIR /var/www


