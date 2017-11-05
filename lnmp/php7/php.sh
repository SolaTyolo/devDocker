#!/bin/bash
docker build --tag solat/php -f php7/Dockerfile .
docker run --name php7 -p 9000:9000 -v /usr/local/var/www/html:/usr/local/nginx/html --link mysql:mysql --link redis:redis -it solat/php
