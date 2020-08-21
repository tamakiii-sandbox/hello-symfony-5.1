.PHONY: help install dependencies build clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

install: \
	dependencies \
	.env \
	build

.env:
	touch $@
	echo UID=$(shell id -u) >> $@
	echo GID=$(shell id -g) >> $@

build:
	docker-compose build

clean:
	docker-compose down
	rm .env
