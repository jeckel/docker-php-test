#!/usr/bin/env sh

# Store command line args
CMD_ARGS=$@
set -e

# Fix www-data user to have same UID than the mounted folder
set -- `ls -nd .` && LOCAL_UID=$3 && LOCAL_GID=$4
usermod -u ${LOCAL_UID} www-data
groupmod -g ${LOCAL_GID} www-data

# Run command with the correct rights
sudo -g \#${LOCAL_GID} -u \#${LOCAL_UID} -E sh -c "${CMD_ARGS}"

