#!/usr/bin/env sh
set -e

if [ ! -z $1 ]; then
    IMAGE_TAG=$1
fi
if [ -z ${IMAGE_TAG} ]; then
    echo "Missing env var IMAGE_TAG"
    exit 1
fi

if [ `whoami` = root ]; then
    echo "Running as root, change to another user"

    if ! egrep -i "1000" /etc/group ; then
        addgroup -g 1000 bob
    fi

    if ! id 1000 >/dev/null 2>/dev/null ; then
        adduser -D -u 1000 -G bob bob && \
        mkdir -p /home/bob && \
        chown -R bob:bob .
    fi
    apk --no-cache add sudo
    chmod +x test-composer.sh
    sudo -u \#1000:\#1000 -E sh "./test-composer.sh ${IMAGE_TAG}"
    exit $?
fi

if [ -d vendor ]; then
    rm -Rf vendor
fi
docker run --rm -it -v `pwd`:/project -w /project php-test:${IMAGE_TAG} composer install

# Retrieve local owner
set -- `ls -nd .` && LOCAL_UID=$3 && LOCAL_GID=$4

# Retrieve "vendor" owner
VENDOR_UID=$(stat -c %u vendor)
VENDOR_GID=$(stat -c %g vendor)

# Check that generated files have the same owner
if [ ${VENDOR_UID} != ${LOCAL_UID} ]; then
    echo "Error, invalid folder owner, expected ${LOCAL_UID}, got ${VENDOR_UID}"
    exit 1
fi
if [ ${VENDOR_GID} != ${LOCAL_GID} ]; then
    echo "Error, invalid folder group owner, expected ${LOCAL_GID}, got ${VENDOR_GID}"
    exit 1
fi
