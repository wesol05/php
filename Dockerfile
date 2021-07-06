ARG PHP_VERSION=8.0

FROM php:${PHP_VERSION}-fpm-alpine

ENV UID=1000
ENV GID=1000

RUN apk add --no-cache --virtual .build-deps \
    $PHPIZE_DEPS

RUN apk update && apk add \
    bash

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN apk del .build-deps

USER $UID:$GID

VOLUME /app
WORKDIR /app