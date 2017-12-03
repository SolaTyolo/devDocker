#!/bin/bash
docker build --tag redis-server -f redis/Dockerfile .
docker run --name redis -p 6379:6379 -it redis-server

#-e REDIS_PASS=**None**