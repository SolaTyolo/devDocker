ARG PHP_VERSION=7.1
FROM daocloud.io/library/php:${PHP_VERSION}-fpm

MAINTAINER solat <solat.yolo@gmail.com>

ENV TIME_ZONE Asia/Shanghai

RUN apt-get update \
    && apt-get install -y lsof \
    && apt-get install wget \
    && apt-get install -y libmcrypt-dev \
    libz-dev \
    libpq-dev \
    libjpeg-dev \
    libpng12-dev \
    libfreetype6-dev \
    &&  rm -rf /var/lib/apt/lists/* \
    &&	docker-php-ext-install mbstring mcrypt pdo_mysql \
    &&  docker-php-ext-configure gd \
    --enable-gd-native-ttf \
    --with-jpeg-dir=/usr/lib \
    --with-freetype-dir=/usr/include/freetype2 \
    &&  docker-php-ext-install gd

RUN echo "${TIME_ZONE}" > /etc/timezone 
RUN rm -rf /etc/localtime 
RUN ln -sf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime

ADD php.ini /usr/local/etc/php/conf.d

RUN rm -rf /var/lib/apt/lists/* \
    && usermod -u 1000 www-data

#添加swoole
RUN wget https://github.com/swoole/swoole-src/archive/v2.1.3.tar.gz \
    && tar xvzf v2.1.3.tar.gz \
    && cd swoole-src-2.1.3 \
    && sudo /usr/local/bin/phpize \
    && ./configure --with-php-config=/usr/local/bin/php-config \
    && sudo make \
    && sudo make install 

RUN groupadd -g ${COMPOSER_PGID} selfdocker && \
    useradd -u ${COMPOSER_PUID} -g selfdocker -m selfdocker

WORKDIR /var/www


