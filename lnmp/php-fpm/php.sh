#!/bin/bash
docker build --tag php-fpm -f php-fpm/Dockerfile .
docker run --name php7 -p 9000:9000 -v /usr/local/var/www/html:/usr/local/nginx/html --link mysql:mysql --link redis:redis -it php-fpm
