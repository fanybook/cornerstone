FROM php:7.1-fpm-alpine

LABEL maintainer="Fanybook <fanybook@126.com>"

ARG CHANGE_ALPINE_SOURCE=false
RUN if [ ${CHANGE_ALPINE_SOURCE} = true ]; then \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories \
;fi

# dep libpng when php start with gd
RUN apk update \
    && apk upgrade \
    && apk add --no-cache --virtual .build-deps \
    build-base \
    libpng-dev \
#    shadow \
#    && groupmod -g 1000 www-data \
#    && usermod -u 1000 www-data \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install gd \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install opcache \
    && apk del .build-deps \
    && apk add --no-cache libpng \
    && rm -rf /var/cache/apk/*

EXPOSE 9000

WORKDIR /var/www

CMD ["php-fpm"]
