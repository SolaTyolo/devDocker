FROM daocloud.io/library/alpine:3.5

MAINTAINER solat <solat.yolo@gmail.com>

RUN apk update
RUN apk upgrade
RUN apk add --no-cache bash

RUN mkdir -p /data
RUN mkdir -p /app
RUN mkdir -p /var/lib/mysql

VOLUME ["/data","/app","var/lib/mysql"]