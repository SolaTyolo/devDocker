ARG PHP_VERSION=7.1
FROM daocloud.io/library/php:${PHP_VERSION}-cli

MAINTAINER solat <solat.yolo@gmail.com>

RUN apt-get update && apt-get install -y libmcrypt-dev
RUN docker-php-exit-install mbstring mcrypt pdo pdo_mysql

# 安装 composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer \
    && composer self-update \
    && composer config -g repo.packagist composer https://packagist.phpcomposer.com \
    && composer global require "laravel/installer=~1.1" \
    && composer global require predis/predis \
    && wget https://phar.phpunit.de/phpunit.phar \
    && chmod +x phpunit.phar \
    && mv phpunit.phar /usr/local/bin/phpunit

RUN mkdir -p /data/www

VOLUME ["/data"]

WORKDIR /data/www

#COPY php.ini /usr/local/etc/php/php.ini

ENTRYPOINT ["composer"]

CMD ["--help"]

