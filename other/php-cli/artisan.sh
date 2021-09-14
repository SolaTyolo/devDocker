#bin/bash

docker build --tag php-artisan -f php-artisan/Dockerfile .

#$docker run --privileged=true --volumes-from data --rm php-artisan