ARG PHP_VERSION=7.1
FROM daocloud.io/library/php:${PHP_VERSION}-fpm

MAINTAINER solat <solat.yolo@gmail.com>

ENV TIME_ZONE Asia/Shanghai

RUN apt-get update \
&& apt-get install -y lsof \
&& apt-get install -y libmcrypt-dev \
        libz-dev \
        libpq-dev \
        libjpeg-dev \
        libpng12-dev \
        libfreetype6-dev \
    &&  rm -rf /var/lib/apt/lists/* \
    &&  docker-php-ext-install mbstring mcrypt pdo_mysql \
    &&  docker-php-ext-configure gd \
        --enable-gd-native-ttf \
        --with-jpeg-dir=/usr/lib \
        --with-freetype-dir=/usr/include/freetype2 \
    &&  docker-php-ext-install gd

###install-swoole
ARG INSTALL_SWOOLE=False
#添加swoole
RUN if [ ${INSTALL_SWOOLE} = True ]; then \
    pecl install swoole \
    && docker-php-ext-enable swoole \
;fi


RUN echo "${TIME_ZONE}" > /etc/timezone 
RUN rm -rf /etc/localtime 
RUN ln -sf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime

ADD php.ini /usr/local/etc/php/conf.d
ADD site.pool.conf /usr/local/etc/php-fpm.d

RUN rm -rf /var/lib/apt/lists/* \
    && usermod -u 1000 www-data

WORKDIR /var/www


