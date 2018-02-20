#bin/bash

alias composer-cli="docker run --privileged=true --volumes-from lnmp_data_1 --rm composer"

alias artisan-cli="docker run --privileged=true --volumes-from lnmp_data_1 --rm lnmp_php-artisan"