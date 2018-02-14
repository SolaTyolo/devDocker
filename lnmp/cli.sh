#bin/bash

alias composer-cli="docker run --privileged=true --volumes-from data --rm php-composer"

alias artisan-cli="$docker run --privileged=true --volumes-from data --rm php-artisan"