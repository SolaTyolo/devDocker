ARG MYSQL_VERSION=5.6
FROM daocloud.io/library/mysql:${MYSQL_VERSION}
MAINTAINER solat <solat.yolo@gmail.com>

#设置时区
ENV TIME_ZONE Asia/Shanghai
RUN echo "${TIME_ZONE}" > /etc/timezone
RUN rm -rf /etc/localtime 
RUN ln -sf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime

RUN chown -R mysql:root /var/lib/mysql/

#自定义配置文件
#COPY my.cnf /etc/mysql/conf.d/my.cnf

CMD ["mysqld"]

EXPOSE 3306