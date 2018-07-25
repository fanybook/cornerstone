FROM redis:3.2-alpine

LABEL maintainer="Fanybook <fanybook@126.com>"

ARG CHANGE_ALPINE_SOURCE=false
RUN if [ ${CHANGE_ALPINE_SOURCE} = true ]; then \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories \
;fi

EXPOSE 6379

CMD ["redis-server"]
