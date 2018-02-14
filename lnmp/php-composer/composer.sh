#bin/bash

docker build --tag php-composer -f php-composer/Dockerfile .

#$docker run --privileged=true --volumes-from data --rm php-composer