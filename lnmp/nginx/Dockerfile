FROM daocloud.io/library/nginx:alpine

MAINTAINER solat <solat.yolo@gmail.com>

#编译后静态文件
#COPY . /usr/share/nginx/html
#复制配置文件
#ADD nginx.conf /etc/nginx/nginx.conf

RUN apk update \
    && apk upgrade \
    && apk add --no-cache bash \

ARG PHP_UPSTREAM_CONTAINER=php-fpm
ARG PHP_UPSTREAM_PORT=9000

# Set upstream conf and remove the default conf
RUN echo "upstream php-upstream { server ${PHP_UPSTREAM_CONTAINER}:${PHP_UPSTREAM_PORT}; }" > /etc/nginx/conf.d/upstream.conf \
    && rm /etc/nginx/conf.d/default.conf

RUN mkdir -p /data
VOLUME ["/data"]

EXPOSE 80 
EXPOSE 443
