FROM daocloud.io/library/nginx:alpine

MAINTAINER solat <solat.yolo@gmail.com>

#设置时区
ENV TIME_ZONE Asia/Shanghai

#复制配置文件
ADD nginx.conf /etc/nginx/

ARG PHP_UPSTREAM_CONTAINER=php-fpm
ARG PHP_UPSTREAM_PORT=9000

#将源换至aliyun
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories

RUN apk update \
	upgrade \
	add --no-cache bash \
	echo "${TIME_ZONE}" > /etc/timezone \
	rm -rf /etc/localtime \ 
	ln -sf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime \
	echo "upstream php-upstream { server ${PHP_UPSTREAM_CONTAINER}:${PHP_UPSTREAM_PORT}; }" > /etc/nginx/conf.d/upstream.conf \
	rm /etc/nginx/conf.d/default.conf

RUN adduser -D -H -u 1000 -s /bin/bash www-data

EXPOSE 443