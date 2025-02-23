DOCKER_COMPOSE = docker compose
DOCKER_COMPOSE_FILE = srcs/docker-compose.yml

all: build up

build:
	if [ ! -d /home/artclave/data/website ]; then
		mkdir -p /home/artclave/data/website
	fi
	if [ ! -d /home/artclave/data/database ]; then
		mkdir -p /home/artclave/data/website
	fi
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) build

up:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up -d

down:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down 

logs:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) logs -f

clean: down
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) rm -f
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down --volumes --remove-orphans -v
	docker volume rm page -f
	docker system prune -f
	docker system prune -a --volumes -f

re: down
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) rm -f
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down
	docker system prune -f
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up -d

reset: clean
	sudo rm -rf /home/artclave/data/website
	sudo rm -rf /home/artclave/data/database

