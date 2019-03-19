# docker-php-test
Collection of docker PHP image dedicated for tests and CI

This images contains :
- A running version of PHP
- xDebug extension installed
- An `entrypoint.sh` which fix running user to match the working directory owner
- composer
- a `wait-for.sh` script (from [eficode/wait-for](https://github.com/eficode/wait-for))

# Versions
- php-7.3-cli-alpine