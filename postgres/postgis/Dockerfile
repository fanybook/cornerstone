FROM mdillon/postgis:11-alpine

LABEL maintainer="Fanybook <fanybook@126.com>"

RUN echo -e "#!/bin/sh\n\nls -l --color=auto \"\$@\"" > /bin/ll \
    && chmod 777 /bin/ll

ARG CHANGE_ALPINE_SOURCE=true
RUN if [ ${CHANGE_ALPINE_SOURCE} = true ]; then \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories \
;fi

RUN sed -ir "s/'UTC'/'Asia\/Shanghai'/g" /var/lib/postgresql/data/postgresql.conf

EXPOSE 5432

CMD ["postgres"]
