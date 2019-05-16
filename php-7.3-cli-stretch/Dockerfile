FROM php:7.3-cli-stretch
LABEL maintainer="Julien MERCIER-ROJAS <julien@jeckel-lab.fr>"

ARG A_COMPOSER_HOME=/var/composer

ENV COMPOSER_HOME=$A_COMPOSER_HOME \
    COMPOSER_ALLOW_SUPERUSER=1 \
    LOCAL_UID='' \
    LOCAL_GID='' \
    ENTRYPOINT_DEBUG=false

RUN apt-get update && apt-get install -y git sudo wget zip libzip-dev
RUN pecl install -f xdebug && \
    docker-php-ext-enable xdebug && \
    docker-php-ext-install -j$(nproc) zip
COPY common/xdebug.ini /etc/php/conf.d/xdebug.ini

# Install composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN mkdir ${A_COMPOSER_HOME} && \
    chown -R www-data:www-data ${A_COMPOSER_HOME} && \
    chmod -R 777 ${A_COMPOSER_HOME}

# Add shell scripts
COPY common/cli-entrypoint.sh /usr/local/bin/entrypoint.sh
COPY common/wait-for-it-bash.sh /usr/local/bin/wait-for-it.sh
RUN chmod 755 /usr/local/bin/*.sh

VOLUME ${A_COMPOSER_HOME}
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
