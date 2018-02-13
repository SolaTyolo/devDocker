#!/bin/bash
docker build --tag mysql-server -f mysql/Dockerfile .
docker run --name mysql -p 3306:3306 -v ~/opt/data/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -it mysql-server
