FROM fanybook/caddy-builder AS builder

# ARG plugins="git"
# RUN caddyplug install ${plugins}

FROM alpine:3.7

MAINTAINER Fanybook <fanybook@126.com>

ARG CHANGE_ALPINE_SOURCE=false
RUN if [ ${CHANGE_ALPINE_SOURCE} = true ]; then \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories \
;fi

RUN apk update \
    && apk upgrade \
    && apk add --no-cache ca-certificates

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

EXPOSE 80 443 2015

WORKDIR /var/www

CMD ["/usr/bin/caddy", "-conf", "/etc/caddy/Caddyfile", "-agree"]
