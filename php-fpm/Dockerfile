FROM php:7.1-fpm-alpine

LABEL maintainer="Fanybook <fanybook@126.com>"

echo -e "#!/bin/sh\n\nls -l --color=auto \"\$@\"" > /bin/ll
chmod 777 /bin/ll

ARG CHANGE_ALPINE_SOURCE=true
RUN if [ ${CHANGE_ALPINE_SOURCE} = true ]; then \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories \
;fi

# dep libpng when php start with gd
RUN apk update \
    && apk upgrade \
    && apk add --no-cache libpng \
    && apk add --no-cache libjpeg-turbo \
    && apk add --no-cache libwebp \
    && apk add --no-cache freetype \
    && apk add --no-cache libmcrypt \
    && apk add --no-cache libpq \
    && apk add --no-cache --virtual .build-deps \
    build-base \
    libpng-dev \
    libjpeg-turbo-dev \
    libwebp-dev \
    freetype-dev \
    libmcrypt-dev \
    postgresql-dev \
#    shadow \
#    && groupmod -g 1000 www-data \
#    && usermod -u 1000 www-data \
    && docker-php-ext-install -j$(nproc) bcmath mcrypt \
    && docker-php-ext-configure gd --with-jpeg-dir=/usr/include/ --with-webp-dir=/usr/include/ --with-freetype-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) pdo_mysql \
    && docker-php-ext-install -j$(nproc) pdo_pgsql \
    && docker-php-ext-install -j$(nproc) opcache \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/*

EXPOSE 9000

WORKDIR /var/www

CMD ["php-fpm"]
