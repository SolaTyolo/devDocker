ARG MYSQL_VERSION=8.0
FROM mysql:${MYSQL_VERSION}

RUN chown -R mysql:root /var/lib/mysql/

#自定义配置文件
ADD startup /etc/mysql/startup
ADD my.cnf /etc/mysql/conf.d/my.cnf