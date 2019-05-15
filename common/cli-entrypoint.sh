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

debug()
{
    if ${ENTRYPOINT_DEBUG}; then
        printf "$1"
    fi
}


debug " --> \033[0;33mCURRENT_UID: \033[0;32m\033[1m${CURRENT_UID}\033[0m | \033[0;33mCURRENT_GID: \033[0;32m\033[1m${CURRENT_GID}\033[0m\n"
debug " --> \033[0;33mLOCAL_UID: \033[0;32m\033[1m${LOCAL_UID}\033[0m | \033[0;33mLOCAL_GID: \033[0;32m\033[1m${LOCAL_GID}\033[0m\n"

# Current user UID same as mounted folder owner
if [ "${LOCAL_UID}" = "${CURRENT_UID}" ]; then
    if [ ! -z ${COMPOSER_HOME} ]; then
        mkdir -p ${COMPOSER_HOME}
    fi
    debug " --> \033[0;33mexec sh -c \"\033[0;32m\033[1m${CMD_ARGS}\033[0;33m\"\033[0m\n"
    exec sh -c "${CMD_ARGS}"
else
    # Fix www-data user to have same UID than the mounted folder
    if ! $(getent passwd ${LOCAL_UID}); then
        usermod -u ${LOCAL_UID} www-data
    fi

    # Try to fix www-data group to have same GID then the mounted folder (if not already in use)
    if [ $(cat /etc/group | grep ":${LOCAL_GID}:" | wc -l) = 1 ]; then
        LOCAL_GID=${LOCAL_UID}
    fi
    groupmod -g ${LOCAL_GID} www-data

    if [ ! -z ${COMPOSER_HOME} ]; then
        mkdir -p ${COMPOSER_HOME} && chown -R www-data:www-data ${COMPOSER_HOME}
    fi

    debug " --> \033[0;33msudo -g \#\033[0;32m\033[1m${LOCAL_GID}\033[0;33m -u \#\033[0;32m\033[1m${LOCAL_UID}\033[0;33m -E sh -c \"\033[0;32m\033[1m${CMD_ARGS}\033[0;33m\"\033[0m\n"
    # Run command with the correct rights
    sudo -g \#${LOCAL_GID} -u \#${LOCAL_UID} -E sh -c "${CMD_ARGS}"
fi
