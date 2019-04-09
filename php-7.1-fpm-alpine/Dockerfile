FROM php:7.1-fpm-alpine
LABEL maintainer="Julien MERCIER-ROJAS <julien@jeckel-lab.fr>"

ARG A_COMPOSER_HOME=/home/www-data/.composer
ENV COMPOSER_HOME=$A_COMPOSER_HOME
ENV LOCAL_UID=''
ENV LOCAL_GID=''

RUN apk --update --no-cache add autoconf g++ make && \
    pecl install -f xdebug && \
    docker-php-ext-enable xdebug && \
    apk del --purge autoconf g++ make

RUN wget https://getcomposer.org/composer.phar -O /usr/bin/composer && \
    chmod +x /usr/bin/composer

RUN apk --no-cache add git shadow sudo

# Add shell scripts
COPY common/fpm-entrypoint.sh /usr/local/bin/entrypoint.sh
COPY common/wait-for-it-alpine.sh /usr/local/bin/wait-for-it.sh

VOLUME ${A_COMPOSER_HOME}
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["php-fpm"]
