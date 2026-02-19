DOCKER_COMPOSE_RUN ?= docker-compose run --rm
DOCKER_COMPOSE_RUN_DB ?= $(DOCKER_COMPOSE_RUN) db
DOCKER_COMPOSE_DEV_FILE ?= .infra/compose/docker-compose.dev.yml
DOCKER_COMPOSE_PROD_FILE ?= .infra/compose/docker-compose.production.yml

dciup-dev:
	docker compose -f $(DOCKER_COMPOSE_DEV_FILE) up -d

dci-dev-build:
	docker compose -f $(DOCKER_COMPOSE_DEV_FILE) build --no-cache

 dciup-prod:
	 docker compose -f $(DOCKER_COMPOSE_PROD_FILE) up -d

 dci-prod-build:
	 docker compose -f $(DOCKER_COMPOSE_PROD_FILE) build --no-cache

install-db:
	$(DOCKER_COMPOSE_RUN_DB) sh /docker-entrypoint-initdb.d/initdb.sh

dci-down:
	docker compose -f $(DOCKER_COMPOSE_DEV_FILE) down

dci-api-shell:
	docker exec -it so-api bash


dci-client-shell:
	docker exec -it so-webclient bash

dci-db-shell:
	docker exec -it so-db sh