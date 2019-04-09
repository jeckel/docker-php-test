[![Twitter](https://img.shields.io/badge/Twitter-%40jeckel4-blue.svg)](https://twitter.com/jeckel4) [![LinkedIn](https://img.shields.io/badge/LinkedIn-Julien%20Mercier-blue.svg)](https://www.linkedin.com/in/jeckel/) [![CircleCI](https://circleci.com/gh/jeckel/docker-php-test.svg?style=svg)](https://circleci.com/gh/jeckel/docker-php-test)

# Supported tags and respective `Dockerfile` links

## Alpine based images
- `7.3-cli-alpine` ([Dockerfile](https://github.com/jeckel/docker-php-test/blob/master/php-7.3-cli-alpine/Dockerfile))
- `7.3-fpm-alpine` ([Dockerfile](https://github.com/jeckel/docker-php-test/blob/master/php-7.3-fpm-alpine/Dockerfile))
- `7.2-cli-alpine` ([Dockerfile](https://github.com/jeckel/docker-php-test/blob/master/php-7.2-cli-alpine/Dockerfile))
- `7.2-fpm-alpine` ([Dockerfile](https://github.com/jeckel/docker-php-test/blob/master/php-7.2-fpm-alpine/Dockerfile))
- `7.1-cli-alpine` ([Dockerfile](https://github.com/jeckel/docker-php-test/blob/master/php-7.1-cli-alpine/Dockerfile))
- `7.1-fpm-alpine` ([Dockerfile](https://github.com/jeckel/docker-php-test/blob/master/php-7.1-fpm-alpine/Dockerfile))

## Debian based images

- `7.3-cli-stretch` ([Dockerfile](https://github.com/jeckel/docker-php-test/blob/master/php-7.3-cli-stretch/Dockerfile))
- `7.2-cli-stretch` ([Dockerfile](https://github.com/jeckel/docker-php-test/blob/master/php-7.2-cli-stretch/Dockerfile))
- `7.1-cli-stretch` ([Dockerfile](https://github.com/jeckel/docker-php-test/blob/master/php-7.1-cli-stretch/Dockerfile))


## Codeception images

**Warning:** *[Codeception](https://codeception.com/) images are still experimental and haven't been fully tested yet*

- `7.3-cli-alpine-codeception` ([Dockerfile](https://github.com/jeckel/docker-php-test/blob/master/php-7.3-cli-alpine-codeception/Dockerfile))

# Docker PHP test images
Collection of docker PHP image dedicated for tests and CI

All this images contains this features:
- a running version of PHP (cli or fpm)
- a working version of `xDebug` extension
- an `entrypoint.sh` which patch the running user to match the working directory owner
- the `composer` dependency manager installed globally
- a `wait-for.sh` script (from [eficode/wait-for](https://github.com/eficode/wait-for)) to be able to wait for other services

# Environment variables

This environment variables can be defined to adapt `entrypoint` to your needs:

- `LOCAL_UID`, `LOCAL_GID`: Force running command to use this UID/GID instead of the ones detected from the working directory owner

# Issues

If you encounter some issues or want to request additional images / version, you can add new [issues on github](https://github.com/jeckel/docker-php-test/issues).

# License

View [license information](https://github.com/jeckel/docker-php-test/blob/master/LICENSE) for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.