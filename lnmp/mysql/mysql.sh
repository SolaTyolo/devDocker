#!/bin/bash
docker build --tag solat/mysql -f mysql/Dockerfile .
docker run --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 -it solat/mysql

#-v /usr/local/root/bo/data/mysql:/var/lib/mysql