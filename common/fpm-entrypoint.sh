#!/usr/bin/env sh

# Store command line args
CMD_ARGS=$@
CMD=$1
set -e

# Fix www-data user to have same UID than the mounted folder
set -- `ls -nd .` && LOCAL_UID=$3 && LOCAL_GID=$4
usermod -u ${LOCAL_UID} www-data
groupmod -g ${LOCAL_GID} www-data

mkdir -p ${COMPOSER_HOME} && chown -R www-data:www-data ${COMPOSER_HOME}

if [ "${CMD}" == "php-fpm" ]; then
    exec ${CMD_ARGS}
else
    sudo -g \#${LOCAL_GID} -u \#${LOCAL_UID} -E sh -c "${CMD_ARGS}"
fi
