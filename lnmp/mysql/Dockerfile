ARG MYSQL_VERSION=5.6
FROM daocloud.io/library/mysql:${MYSQL_VERSION}
MAINTAINER solat <solat.yolo@gmail.com>

ENV TZ "Asia/Shanghai"

RUN chown -R mysql:root /var/lib/mysql/

#自定义配置文件
#COPY my.cnf /etc/mysql/conf.d/my.cnf

CMD ["mysqld"]

EXPOSE 3306