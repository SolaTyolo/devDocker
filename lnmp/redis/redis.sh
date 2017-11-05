#!/bin/bash
docker build --tag solat/redis -f php7/Dockerfile .
docker run --name redis -p 6379:6379 -it solat/redis

#-e REDIS_PASS=**None**