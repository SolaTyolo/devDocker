ARG PHP_VERSION=7.1
FROM daocloud.io/library/php:${PHP_VERSION}-fpm

MAINTAINER solat <solat.yolo@gmail.com>

ENV TIME_ZONE Asia/Shanghai

RUN apt-get update && apt-get install -y libmcrypt-dev
RUN docker-php-ext-install mbstring mcrypt pdo pdo_mysql
RUN echo "${TIME_ZONE}" > /etc/timezone 
RUN rm -rf /etc/localtime 
RUN ln -sf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime

#WORKDIR /var/www

RUN mkdir -p /data

VOLUME ["/data"]

#COPY php.ini /usr/local/etc/php/

CMD ["php-fpm"]

EXPOSE 9000
