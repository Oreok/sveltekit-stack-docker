CURRENT_DIR := $(patsubst %/,%,$(dir $(realpath $(firstword $(MAKEFILE_LIST)))))
ROOT_DIR := $(CURRENT_DIR)
CURRENT_USER :=
DOCKER_FR_NAME := dev_frontend_vite
DOCKER_BE_NAME := dev_backend
DOCKER_COMPOSE := docker-compose
DOCKER_EXEC_TOOLS_FR := $(CURRENT_USER) docker exec $(DOCKER_FR_NAME) sh
DOCKER_EXEC_TOOLS_BE := $(CURRENT_USER) docker exec $(DOCKER_BE_NAME) sh
NODE_INSTALL := "npm i"
FRONTEND_RUN := "npm run dev"
BACKEND_RUN := "npm start"

.PHONY: build install dev up start create stop restart clear

build:
	$(DOCKER_COMPOSE) up --build --no-recreate -d

install:
	$(DOCKER_EXEC_TOOLS_FR) -c $(NODE_INSTALL)
	$(DOCKER_EXEC_TOOLS_BE) -c $(NODE_INSTALL)

dev:
	$(DOCKER_EXEC_TOOLS_BE) -c $(BACKEND_RUN) &
	wait
	$(DOCKER_EXEC_TOOLS_FR) -c $(FRONTEND_RUN) &
	wait
	$(DOCKER_COMPOSE) logs -f

up:
	$(DOCKER_COMPOSE) up -d

start: up dev
	# this will up the docker env and run the npm run dev it

create: build install dev
	# this will build the env, up it and run the npm install and then run npm run dev it

stop: $(ROOT_DIR)/docker-compose.yml
	$(DOCKER_COMPOSE) kill || true
	$(DOCKER_COMPOSE) rm --force || true

restart: stop start dev

clear: stop $(ROOT_DIR)/docker-compose.yml
	$(DOCKER_COMPOSE) down -v --remove-orphans || true
