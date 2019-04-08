#!/usr/bin/env sh

# Store command line args
CMD_ARGS=$@
set -e

# Get running user
CURRENT_UID=$(id -u)
CURRENT_GID=$(id -g)

# Get working directory owner
set -- `ls -nd .` && LOCAL_UID=$3 && LOCAL_GID=$4


# Current user UID same as mounted folder owner
if [[ ${LOCAL_UID} = ${CURRENT_UID} ]]; then
    if [[ ! -z ${COMPOSER_HOME} ]]; then
        mkdir -p ${COMPOSER_HOME}
    fi

    exec ${CMD_ARGS}
else
    # Fix www-data user to have same UID than the mounted folder
    usermod -u ${LOCAL_UID} www-data
    groupmod -g ${LOCAL_GID} www-data

    if [[ ! -z ${COMPOSER_HOME} ]]; then
        mkdir -p ${COMPOSER_HOME} && chown -R www-data:www-data ${COMPOSER_HOME}
    fi

    # Run command with the correct rights
    sudo -g \#${LOCAL_GID} -u \#${LOCAL_UID} -E sh -c "${CMD_ARGS}"
fi