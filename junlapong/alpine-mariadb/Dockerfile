FROM alpine:3.5
MAINTAINER junlapong - https://github.com/junlapong

ENV TZ "Asia/Bangkok"

RUN apk --update add bash tzdata mysql mysql-client pwgen && \
    rm -f /var/cache/apk/* && \
    echo "Success"

ADD scripts/run.sh /scripts/run.sh
RUN mkdir /scripts/pre-exec.d && \
    mkdir /scripts/pre-init.d && \
    chmod -R 755 /scripts

RUN ln -sf "/usr/share/zoneinfo/$TZ" /etc/localtime && \
    echo "$TZ" > /etc/timezone && date

EXPOSE 3306

VOLUME ["/var/lib/mysql"]

ENTRYPOINT ["/scripts/run.sh"]
CMD []