# ENV_FILE := .env.composefile
# ENV = $(shell cat $(ENV_FILE))

.PHONY: check-env
check-env:
	docker-compose --env-file ./.env.composefile config

########################################
# Docker Compose up
########################################

.PHONY: build
build:
	docker-compose --env-file ./.env.composefile build

.PHONY: up
up:
	docker-compose --env-file ./.env.composefile up

.PHONY: upb
devb:
	docker-compose --env-file ./.env.composefile up nginx app db

.PHONY: updevb
updevb:
	docker-compose --env-file ./.env.composefile up app db

.PHONY: upf
upf:
	docker-compose --env-file ./.env.composefile up frontend

########################################
# into Docker container
########################################

.PHONY: inapp
inapp:
	docker-compose exec app bash

.PHONY: indb
indb:
	docker-compose exec db mysql -umyuser -ppassword