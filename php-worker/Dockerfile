FROM php:7.1-cli-alpine

LABEL maintainer="Fanybook <fanybook@126.com>"

ARG CHANGE_ALPINE_SOURCE=false
RUN if [ ${CHANGE_ALPINE_SOURCE} = true ]; then \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories \
;fi

# dep libpng when php start with gd
RUN apk update \
    && apk upgrade \
    && apk add --no-cache libpng \
    && apk add --no-cache supervisor \
    && apk add --no-cache --virtual .build-deps \
    build-base \
    libpng-dev \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install gd \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install opcache \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/*

EXPOSE 9001

WORKDIR /var/www
