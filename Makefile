.PHONY: run composer-version codeception-version

DOCKERFILES=$(patsubst ./%/Dockerfile, %, $(shell find . -name 'Dockerfile' | sort))
COMMONFILES=$(shell find ./common -name '*.sh')

default: $(DOCKERFILES)

php-%: php-%/Dockerfile $(COMMONFILES)
	@docker build -f $< -t php-test:$@ .

run:
	@docker run --rm -it -v $(shell pwd):/app -w /app php-test:${TAG} ${CMD}

composer-version:
	@docker run --rm -v $(shell pwd):/app -w /app php-test:${TAG} composer -V

codeception-version:
	@docker run --rm -v $(shell pwd):/app -w /app php-test:${TAG} codecept -V

