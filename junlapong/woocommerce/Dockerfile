FROM junlapong/alpine-nginx-php7

ENV WOOCOMMERCE_VERSION 2.6.14
ENV WWW_DOCROOT /var/www

RUN apk update && apk --no-cache add unzip wget && \
    rm -rf /var/cache/apk/*

RUN curl -o wordpress.tar.gz -SL https://wordpress.org/latest.tar.gz && \
    tar -xzf wordpress.tar.gz -C $WWW_DOCROOT && \
    rm wordpress.tar.gz

RUN wget https://downloads.wordpress.org/plugin/woocommerce.$WOOCOMMERCE_VERSION.zip -O /tmp/temp.zip && \
    cd $WWW_DOCROOT/wordpress/wp-content/plugins && \
    unzip /tmp/temp.zip && \
    rm /tmp/temp.zip && \
    date

RUN adduser -S www-data && \
    chown www-data.www-data -R $WWW_DOCROOT

COPY conf/nginx.conf /etc/nginx

EXPOSE 80 443
