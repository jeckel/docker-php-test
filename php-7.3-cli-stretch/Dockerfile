FROM php:7.3-cli-stretch
LABEL maintainer="Julien MERCIER-ROJAS <julien@jeckel-lab.fr>"

ARG A_COMPOSER_HOME=/var/composer
ENV COMPOSER_HOME=$A_COMPOSER_HOME
ENV LOCAL_UID=''
ENV LOCAL_GID=''

RUN apt-get update && apt-get install -y git sudo wget zip
RUN pecl install -f xdebug && \
    docker-php-ext-enable xdebug

RUN wget https://getcomposer.org/composer.phar -O /usr/bin/composer && \
    chmod +x /usr/bin/composer

# Add shell scripts
COPY common/cli-entrypoint.sh /usr/local/bin/entrypoint.sh
COPY common/wait-for-it-bash.sh /usr/local/bin/wait-for-it.sh
RUN chmod 755 /usr/local/bin/*.sh

VOLUME ${A_COMPOSER_HOME}
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
