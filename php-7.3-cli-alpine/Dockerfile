FROM php:7.3-cli-alpine
ARG A_COMPOSER_HOME=/home/www-data/.composer
ENV COMPOSER_HOME=$A_COMPOSER_HOME

RUN apk --update --no-cache add autoconf g++ make && \
    pecl install -f xdebug && \
    docker-php-ext-enable xdebug && \
    apk del --purge autoconf g++ make

RUN wget https://getcomposer.org/composer.phar -O /usr/bin/composer && \
    chmod +x /usr/bin/composer && \
    mkdir -p ${A_COMPOSER_HOME} && \
    chown -R www-data:www-data ${A_COMPOSER_HOME}

RUN apk --no-cache add git shadow sudo

# Add shell scripts
COPY common/cli-entrypoint.sh /usr/local/bin/entrypoint.sh
COPY common/wait-for.sh /usr/local/bin/wait-for.sh

VOLUME ${A_COMPOSER_HOME}
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
