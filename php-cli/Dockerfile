ARG PHP_VERSION=7.1
FROM daocloud.io/library/php:${PHP_VERSION}-cli

MAINTAINER solat <solat.yolo@gmail.com>

RUN apt-get update 
RUN apt-get install -y wget git libmcrypt-dev supervisor

RUN docker-php-ext-install mysqli mbstring pdo pdo_mysql mcrypt tokenizer

RUN mkdir -p /var/www

#supervisor配置
COPY supervisord.conf /etc/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c",  "/etc/supervisord.conf"]

#服务器时间
ARG TZ=PRC
ENV TZ ${TZ}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /var/www


