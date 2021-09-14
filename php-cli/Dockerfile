ARG PHP_VERSION=7.1
FROM daocloud.io/library/php:${PHP_VERSION}-cli

MAINTAINER solat <solat.yolo@gmail.com>

RUN apt-get update --fix-missing
RUN apt-get install -y lsof \
&& apt-get install -y libmcrypt-dev \
        libz-dev \
        libpq-dev \
        libjpeg-dev \
        libpng-dev \
        libfreetype6-dev \
        supervisor \
        wget \
        git \
        zip \
        unzip \
    &&  rm -rf /var/lib/apt/lists/* \
    &&  docker-php-ext-install mysqli mbstring pdo pdo_mysql mcrypt tokenizer \
    &&  docker-php-ext-configure gd \
        --enable-gd-native-ttf \
        --with-jpeg-dir=/usr/lib \
        --with-freetype-dir=/usr/include/freetype2 \
    &&  docker-php-ext-install gd


RUN mkdir -p /var/www

#添加composer
RUN curl -sS https://getcomposer.org/installer | php && \
    echo "export PATH=${PATH}:/var/www/vendor/bin" >> ~/.bashrc && \
    mv composer.phar /usr/local/bin/composer
RUN . ~/.bashrc


ARG COMPOSER_PUID=1000
ARG COMPOSER_PGID=1000

RUN groupadd -g ${COMPOSER_PGID} selfdocker && \
    useradd -u ${COMPOSER_PUID} -g selfdocker -m selfdocker

USER selfdocker
# 更新composer
RUN /usr/local/bin/composer self-update
# 使用中国镜像
RUN composer config -g repo.packagist composer https://packagist.phpcomposer.com

#supervisor配置
USER root
COPY supervisord.conf /etc/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c",  "/etc/supervisord.conf"]

#服务器时间
ARG TZ=PRC
ENV TZ ${TZ}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /var/www


