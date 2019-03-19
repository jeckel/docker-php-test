FROM php:7.3-fpm-alpine
RUN apk --update --no-cache add autoconf g++ make && \
    pecl install -f xdebug && \
    docker-php-ext-enable xdebug && \
    apk del --purge autoconf g++ make

RUN wget https://getcomposer.org/composer.phar -O /usr/bin/composer && chmod +x /usr/bin/composer

RUN apk --no-cache add shadow

# Add shell scripts
COPY common/fpm-entrypoint.sh /usr/local/bin/entrypoint.sh
COPY common/wait-for.sh /usr/local/bin/wait-for.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["php-fpm"]
