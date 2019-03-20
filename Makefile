.PHONY: build-php73-cli-alpine build-php73-fpm-alpine build-php72-cli-alpine build-php72-fpm-alpine build-php71-cli-alpine build-php71-fpm-alpine

default: build-php73-cli-alpine build-php73-fpm-alpine build-php72-cli-alpine build-php72-fpm-alpine build-php71-cli-alpine build-php71-fpm-alpine

build-php73-cli-alpine:
	@docker build -f php-7.3-cli-alpine/Dockerfile -t php-test:7.3-cli-alpine .

build-php73-fpm-alpine:
	@docker build -f php-7.3-fpm-alpine/Dockerfile -t php-test:7.3-fpm-alpine .

build-php72-cli-alpine:
	@docker build -f php-7.2-cli-alpine/Dockerfile -t php-test:7.2-cli-alpine .

build-php72-fpm-alpine:
	@docker build -f php-7.2-fpm-alpine/Dockerfile -t php-test:7.2-fpm-alpine .

build-php71-cli-alpine:
	@docker build -f php-7.1-cli-alpine/Dockerfile -t php-test:7.1-cli-alpine .

build-php71-fpm-alpine:
	@docker build -f php-7.1-fpm-alpine/Dockerfile -t php-test:7.1-fpm-alpine .
