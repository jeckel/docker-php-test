#!/usr/bin/env sh

# Store command line args
CMD_ARGS=$@
CMD=$1
set -e

# Get working directory owner
set -- `ls -nd .` && WORKDIR_UID=$3 && WORKDIR_GID=$4

# If not defined in env var, set with workdir UID
LOCAL_UID=${LOCAL_UID:-${WORKDIR_UID}}
LOCAL_GID=${LOCAL_GID:-${WORKDIR_GID}}

usermod -u ${LOCAL_UID} www-data
groupmod -g ${LOCAL_GID} www-data

mkdir -p ${COMPOSER_HOME} && chown -R www-data:www-data ${COMPOSER_HOME}

if [ "${CMD}" == "php-fpm" ]; then
    exec ${CMD_ARGS}
else
    sudo -g \#${LOCAL_GID} -u \#${LOCAL_UID} -E sh -c "${CMD_ARGS}"
fi
