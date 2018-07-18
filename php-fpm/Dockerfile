FROM php:7.1-fpm-alpine

LABEL maintainer="Fanybook <fanybook@126.com>"

ARG CHANGE_ALPINE_SOURCE=true
RUN if [ ${CHANGE_ALPINE_SOURCE} = true ]; then \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories \
;fi

# don't del libpng-dev (dep libpng when php start with gd)
RUN apk update \
    && apk upgrade \
    && apk add --no-cache --virtual .build-deps \
    build-base \
    shadow \
    && usermod -u 1000 www-data
    && docker-php-ext-install bcmath \
    && apk add --no-cache libpng-dev \
    && docker-php-ext-install gd \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/*

EXPOSE 9000

WORKDIR /var/www

CMD ["php-fpm"]
