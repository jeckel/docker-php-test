[![Twitter](https://img.shields.io/badge/Twitter-%40jeckel4-blue.svg)](https://twitter.com/jeckel4) [![LinkedIn](https://img.shields.io/badge/LinkedIn-Julien%20Mercier-blue.svg)](https://www.linkedin.com/in/jeckel/) [![CircleCI](https://circleci.com/gh/jeckel/docker-php-test.svg?style=svg)](https://circleci.com/gh/jeckel/docker-php-test)

# Supported tags and respective `Dockerfile` links

- `7.3-cli-alpine` ([php-7.3-cli-alpine/Dockerfile](https://github.com/jeckel/docker-php-test/blob/master/php-7.3-cli-alpine/Dockerfile))
- `7.3-fpm-alpine` ([php-7.3-fpm-alpine/Dockerfile](https://github.com/jeckel/docker-php-test/blob/master/php-7.3-fpm-alpine/Dockerfile))
- `7.2-cli-alpine` ([php-7.2-cli-alpine/Dockerfile](https://github.com/jeckel/docker-php-test/blob/master/php-7.2-cli-alpine/Dockerfile))
- `7.2-fpm-alpine` ([php-7.2-fpm-alpine/Dockerfile](https://github.com/jeckel/docker-php-test/blob/master/php-7.2-fpm-alpine/Dockerfile))

# Docker PHP test images
Collection of docker PHP image dedicated for tests and CI

All this images contains this features:
- a running version of PHP (cli or fpm)
- a working version of `xDebug` extension
- an `entrypoint.sh` which patch the running user to match the working directory owner
- the `composer` dependency manager installed globally
- a `wait-for.sh` script (from [eficode/wait-for](https://github.com/eficode/wait-for)) to be able to wait for other services

# Issues

If you encounter some issues or want to request additional images / version, you can add new [issues on github](https://github.com/jeckel/docker-php-test/issues).