FROM composer:latest

MAINTAINER solat <solat.yolo@gmail.com>

ARG COMPOSER_PUID=1000
ARG COMPOSER_PGID=1000

RUN addgroup -g ${COMPOSER_PGID} selfdocker
RUN adduser -u ${COMPOSER_PUID} -D -G selfdocker selfdocker


RUN mkdir -p /var/www

WORKDIR /var/www 