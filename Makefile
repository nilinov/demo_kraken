#!/usr/bin/make
# Makefile readme (ru): <http://linux.yaroslavl.ru/docs/prog/gnu_make_3-79_russian_manual.html>
# Makefile readme (en): <https://www.gnu.org/software/make/manual/html_node/index.html#SEC_Contents>

docker_bin := $(shell command -v docker 2> /dev/null)
dc_bin := $(shell command -v docker-compose 2> /dev/null)
dc_app_name = lampo-krakend
dc_image_name = lampo-krakend
public_port = 8080
cwd = $(shell pwd)

SHELL = /bin/bash
CURRENT_USER = $(shell id -u):$(shell id -g)
RUN_APP_ARGS = --rm --user "$(CURRENT_USER)" "$(dc_app_name)"

define print
	printf " \033[33m[%s]\033[0m \033[32m%s\033[0m\n" $1 $2
endef
define print_block
	printf " \e[30;48;5;82m  %s  \033[0m\n" $1
endef


.PHONY : help \
		 shell \
		 run \
		 build \
		 debug \
		 check \
		 up down restart
.SILENT : help up down
.DEFAULT_GOAL : help

# This will output the help for each task. thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help: ## Show this help
	@printf "\033[33m%s:\033[0m\n" 'Available commands'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[32m%-18s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)


check: ## Check build
	$(docker_bin) run -it -p 8080:8080 -v $(cwd)/src:/etc/krakend/ devopsfaith/krakend check --config krakend.json

debug:
	$(docker_bin) run -p $(public_port):8080 --env-file ./.env -v $(cwd)/src:/etc/krakend/ devopsfaith/krakend run -d -c /etc/krakend/krakend.json