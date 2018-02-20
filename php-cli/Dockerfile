ARG PHP_VERSION=7.1
FROM daocloud.io/library/php:${PHP_VERSION}-cli

MAINTAINER solat <solat.yolo@gmail.com>

RUN apt-get update && apt-get install -y libmcrypt-dev
RUN docker-php-ext-install mbstring mcrypt pdo pdo_mysql

RUN mkdir -p /data/www

VOLUME ["/data"]

WORKDIR /data/www

ENTRYPOINT ["php","artisan"]

CMD ["env"]

