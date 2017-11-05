#!/bin/bash
docker build --tag solat/nginx -f nginx/Dockerfile .
docker run --name nginx -p 80:80 -v /usr/local/var/www/html:/usr/local/nginx/html --link php7:php7 -it solat/nginx
