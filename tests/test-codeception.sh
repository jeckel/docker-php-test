#!/usr/bin/env bash

set -e

TAG=$1
if [ -z ${TAG} ]; then
    echo "Missing tag name"
    exit 1
fi

if [ -d codecept ]; then
    rm -Rf codecept
fi

mkdir -p codecept
cd codecept
docker run --rm -it -v `pwd`:/app -w /app php-test:${TAG} codecept bootstrap
cd ..