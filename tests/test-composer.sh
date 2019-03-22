#!/usr/bin/env bash

set -e

TAG=$1
if [ -z ${TAG} ]; then
    echo "Missing tag name"
    exit 1
fi

if [ -d composer ]; then
    rm -Rf composer
fi

mkdir -p composer
cd composer
docker run --rm -it -v `pwd`:/app -w /app php-test:${TAG} composer init
cd ..