FROM daocloud.io/library/redis:alpine
MAINTAINER solat <solat.yolo@gmail.com>

#设置时区
ENV TIME_ZONE Asia/Shanghai
RUN echo "${TIME_ZONE}" > /etc/timezone
RUN rm -rf /etc/localtime 
RUN ln -sf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime

#配置文件
#COPY redis.conf /usr/local/etc/redis/redis.conf
