[![Twitter](https://img.shields.io/badge/Twitter-%40jeckel4-blue.svg)](https://twitter.com/jeckel4) [![LinkedIn](https://img.shields.io/badge/LinkedIn-Julien%20Mercier-blue.svg)](https://www.linkedin.com/in/jeckel/) [![CircleCI](https://circleci.com/gh/jeckel/docker-php-test.svg?style=svg)](https://circleci.com/gh/jeckel/docker-php-test)

# Docker PHP test images
Collection of docker PHP image dedicated for tests and CI

This images contains :
- A running version of PHP
- xDebug extension installed
- An `entrypoint.sh` which fix running user to match the working directory owner
- composer
- a `wait-for.sh` script (from [eficode/wait-for](https://github.com/eficode/wait-for))

# Versions
- php-7.3-cli-alpine
- php-7.3-fpm-alpine