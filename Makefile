.PHONY: build-php73-cli-alpine build-php73-fpm-alpine

default: build-php73-cli-alpine build-php73-fpm-alpine

build-php73-cli-alpine:
	@docker build -f php-7.3-cli-alpine/Dockerfile -t php-test:7.3-cli-alpine .

build-php73-fpm-alpine:
	@docker build -f php-7.3-fpm-alpine/Dockerfile -t php-test:7.3-fpm-alpine .