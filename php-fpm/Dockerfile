ARG PHP_VERSION=7.1
FROM daocloud.io/library/php:${PHP_VERSION}-fpm

MAINTAINER solat <solat.yolo@gmail.com>

ENV TIME_ZONE Asia/Shanghai

RUN apt-get update && apt-get install -y libmcrypt-dev \
	&&	docker-php-ext-install mbstring mcrypt pdo_mysql

RUN echo "${TIME_ZONE}" > /etc/timezone 
RUN rm -rf /etc/localtime 
RUN ln -sf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime

ADD php.ini /usr/local/etc/php/conf.d
ADD site.pool.conf /usr/local/etc/php-fpm.d

RUN rm -rf /var/lib/apt/lists/* \
	&& usermod -u 1000 www-data

WORKDIR /var/www


