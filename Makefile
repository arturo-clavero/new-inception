DOCKER_COMPOSE = docker compose
DOCKER_COMPOSE_FILE = srcs/docker-compose.yml

all: build up

build:
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
	sudo rm -rf /home/artclave/data/*
	sudo rm -rf /home/artclave/db/*

# env:
# DB_ROOT_PW=hello
# DB_NAME=wordpress
# DB_ADMIN=artclave #CAN NOT BE ADMIN!
# DB_ADMIN_PW="123"
# WP_ADMIN=MrCat
# WP_ADMIN_PW=tuna
# WP_ADMIN_EMAIL=bob@gmail.com
# WP_USER2=JustAPeasant
# WP_USER2_EMAIL=nameless@gmail.com
# WP_USER2_PW=trucks
# DOCKER_BUILDKIT=1
