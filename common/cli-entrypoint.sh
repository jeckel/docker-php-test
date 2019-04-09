#!/usr/bin/env sh

# Store command line args
CMD_ARGS=$@
set -e

# Get running user
CURRENT_UID=$(id -u)
CURRENT_GID=$(id -g)

# Get working directory owner
set -- `ls -nd .` && WORKDIR_UID=$3 && WORKDIR_GID=$4

# If not defined in env var, set with workdir UID
LOCAL_UID=${LOCAL_UID:-${WORKDIR_UID}}
LOCAL_GID=${LOCAL_GID:-${WORKDIR_GID}}

printf "==> \033[0;33mLOCAL_UID: \033[0;32m\033[1m${LOCAL_UID}\033[0m | \033[0;33mLOCAL_GID: \033[0;32m\033[1m${LOCAL_GID}\033[0m\n"

# Current user UID same as mounted folder owner
if [[ ${LOCAL_UID} = ${CURRENT_UID} ]]; then
    if [[ ! -z ${COMPOSER_HOME} ]]; then
        mkdir -p ${COMPOSER_HOME}
    fi

    exec ${CMD_ARGS}
else
    # Fix www-data user to have same UID than the mounted folder
    if ! $(getent passwd ${LOCAL_UID}); then
        usermod -u ${LOCAL_UID} www-data
        groupmod -g ${LOCAL_GID} www-data
    fi

    if [[ ! -z ${COMPOSER_HOME} ]]; then
        mkdir -p ${COMPOSER_HOME} && chown -R www-data:www-data ${COMPOSER_HOME}
    fi

    # Run command with the correct rights
    sudo -g \#${LOCAL_GID} -u \#${LOCAL_UID} -E sh -c "${CMD_ARGS}"
fi