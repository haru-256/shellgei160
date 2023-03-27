.PHONY: help build up down logs ps
.DEFAULT_GOAL := help

DOCKER_TAG := latest
build: ## build docker container
	docker compose build --build-arg tag=${DOCKER_TAG}

up: ## Do docker compose up
	docker compose up -d

down: ## Do docker compose down
	docker compose down

login: ## login into docker container
	docker compose exec -it app /bin/bash

logs: ## Tail docker compose logs
	docker compose logs -f

ps: ## Check container status
	docker compose ps

help: ## Show options
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
