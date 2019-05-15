FROM php:7.3-fpm-alpine
LABEL maintainer="Julien MERCIER-ROJAS <julien@jeckel-lab.fr>"

ARG A_COMPOSER_HOME=/home/www-data/.composer

ENV COMPOSER_HOME=$A_COMPOSER_HOME \
    COMPOSER_ALLOW_SUPERUSER=1 \
    LOCAL_UID='' \
    LOCAL_GID='' \
    ENTRYPOINT_DEBUG=false

RUN apk --update --no-cache add autoconf g++ make libzip-dev && \
    pecl install -f xdebug && \
    docker-php-ext-enable xdebug && \
    docker-php-ext-install -j$(nproc) zip && \
    apk del --purge autoconf g++ make

# Install composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN mkdir ${A_COMPOSER_HOME} && \
    chown -R www-data:www-data ${A_COMPOSER_HOME} && \
    chmod -R 777 ${A_COMPOSER_HOME}

RUN apk --no-cache add git shadow sudo

# Add shell scripts
COPY common/fpm-entrypoint.sh /usr/local/bin/entrypoint.sh
COPY common/wait-for-it-alpine.sh /usr/local/bin/wait-for-it.sh
RUN chmod 755 /usr/local/bin/*.sh

VOLUME ${A_COMPOSER_HOME}
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["php-fpm"]
