FROM composer:latest


ARG COMPOSER_PUID=1000
ARG COMPOSER_PGID=1000

RUN addgroup -g ${COMPOSER_PGID} composer
RUN adduser -u ${COMPOSER_PUID} -D -G composer composer

### use chinese proxy
ARG USE_CHINA_PROXY=False
RUN if [ ${USE_CHINA_PROXY} = True ]; then \
      composer config -g repo.packagist composer https://packagist.phpcomposer.com \
;fi

USER composer

# workspace at /app
