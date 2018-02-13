FROM daocloud.io/library/redis:alpine
MAINTAINER solat <solat.yolo@gmail.com>

ENV TZ "Asia/Shanghai"

#配置文件
#COPY redis.conf /usr/local/etc/redis/redis.conf

#将数据持久化到/data
VOLUME /data

EXPOSE 6379

CMD ["redis-server"]