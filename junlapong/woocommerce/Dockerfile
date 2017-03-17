FROM junlapong/alpine-nginx-php7

ENV WOOCOMMERCE_VERSION 2.6.14

RUN curl -o wordpress.tar.gz -SL https://wordpress.org/latest.tar.gz \
    && tar -xzf wordpress.tar.gz -C /var/www \
    && rm wordpress.tar.gz

RUN apk update && apk add unzip wget \
    && wget https://downloads.wordpress.org/plugin/woocommerce.2.6.14.zip -O /tmp/temp.zip \
    && cd /var/www/wordpress/wp-content/plugins \
    && unzip /tmp/temp.zip \
    && rm /tmp/temp.zip

COPY www/index.php /var/www
RUN chown root:root -R /var/www

EXPOSE 80 443
