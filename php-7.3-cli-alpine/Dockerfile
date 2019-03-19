FROM php:7.3-cli-alpine
RUN apk --update --no-cache add autoconf g++ make && \
    pecl install -f xdebug && \
    docker-php-ext-enable xdebug && \
    apk del --purge autoconf g++ make

RUN wget https://getcomposer.org/composer.phar -O /usr/bin/composer && chmod +x /usr/bin/composer

RUN apk --no-cache add git shadow sudo

# Add shell scripts
COPY common/*.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
