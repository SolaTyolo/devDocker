#!/bin/bash
docker build --tag data-server -f data/Dockerfile .
docker run --name data -v /usr/local/var/www/:/data -it data-server
