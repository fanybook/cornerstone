FROM php:7.1-cli-alpine

LABEL maintainer="Fanybook <fanybook@126.com>"

ARG CHANGE_ALPINE_SOURCE=false
RUN if [ ${CHANGE_ALPINE_SOURCE} = true ]; then \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories \
;fi

# dep libpng when php start with gd
RUN apk update \
    && apk upgrade \
    && apk add --no-cache openssh \
    && apk add --no-cache git \
    && apk add --no-cache subversion \
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

RUN echo "root:root" | chpasswd \
    && sed -ir 's/#PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config \
    && sed -ir 's/#Port 22/Port 22/g' /etc/ssh/sshd_config \
    && sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_key/HostKey \/etc\/ssh\/ssh_host_key/g' /etc/ssh/sshd_config \
    && sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_rsa_key/HostKey \/etc\/ssh\/ssh_host_rsa_key/g' /etc/ssh/sshd_config \
    && sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_dsa_key/HostKey \/etc\/ssh\/ssh_host_dsa_key/g' /etc/ssh/sshd_config \
    && sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_ecdsa_key/HostKey \/etc\/ssh\/ssh_host_ecdsa_key/g' /etc/ssh/sshd_config \
    && sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_ed25519_key/HostKey \/etc\/ssh\/ssh_host_ed25519_key/g' /etc/ssh/sshd_config \
    && /usr/bin/ssh-keygen -A \
    && ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key

EXPOSE 22

WORKDIR /var/www

CMD ["sshd", "-D"]
