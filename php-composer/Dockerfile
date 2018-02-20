FROM composer:latest

MAINTAINER solat <solat.yolo@gmail.com>

ARG COMPOSER_PUID=1000
ARG COMPOSER_PGID=1000

RUN groupadd -g ${COMPOSER_PGID} selfdocker && \
    useradd -u ${COMPOSER_PUID} -g selfdocker -m selfdocker

RUN mkdir -p /var/www

WORKDIR /var/www 