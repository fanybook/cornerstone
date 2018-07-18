FROM golang:1.10.3-alpine3.7 as builder

ARG CHANGE_ALPINE_SOURCE=false
RUN if [ ${CHANGE_ALPINE_SOURCE} = true ]; then \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories \
;fi

ARG plugins="git"
RUN apk update \
    && apk upgrade \
    && apk add --no-cache git \
    && apk add --no-cache --virtual .build-deps \
    build-base \
    && go get github.com/abiosoft/caddyplug/caddyplug \
    && caddyplug install-caddy \
    && caddyplug install ${plugins} \
    && caddy --version \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/*
#    && rm -rf /go/src \
#    && rm -rf /root/lib
