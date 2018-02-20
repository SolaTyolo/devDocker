FROM daocloud.io/library/nginx:alpine

MAINTAINER solat <solat.yolo@gmail.com>

#设置时区
ENV TIME_ZONE Asia/Shanghai

#编译后静态文件
#COPY . /usr/share/nginx/html
#复制配置文件
COPY nginx.conf /etc/nginx/nginx.conf

RUN apk update
RUN apk upgrade
RUN apk add --no-cache bash
RUN echo "${TIME_ZONE}" > /etc/timezone 
RUN rm -rf /etc/localtime 
RUN ln -sf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime

ARG PHP_UPSTREAM_CONTAINER=php-fpm
ARG PHP_UPSTREAM_PORT=9000

# Set upstream conf and remove the default conf
RUN echo "upstream php-upstream { server ${PHP_UPSTREAM_CONTAINER}:${PHP_UPSTREAM_PORT}; }" > /etc/nginx/conf.d/upstream.conf \
    && rm /etc/nginx/conf.d/default.conf

RUN mkdir -p /data
VOLUME ["/data"]

EXPOSE 80 
EXPOSE 443