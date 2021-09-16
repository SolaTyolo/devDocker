FROM composer:latest


ARG COMPOSER_PUID=1000
ARG COMPOSER_PGID=1000

RUN addgroup -g ${COMPOSER_PGID} composer
RUN adduser -u ${COMPOSER_PUID} -D -G composer composer

USER composer

# workspace at /app
