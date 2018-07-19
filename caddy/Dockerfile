FROM fanybook/caddy-builder AS builder

# ARG plugins="git"
# RUN caddyplug install ${plugins}

FROM alpine:3.7

MAINTAINER Fanybook <fanybook@126.com>

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

EXPOSE 80 443 2015

WORKDIR /var/www

CMD ["/usr/bin/caddy", "-conf", "/etc/caddy/Caddyfile"]
