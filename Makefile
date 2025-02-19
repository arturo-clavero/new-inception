# BUILD :
# docker compose down
# docker ps -a
# docker compose build 
# docker compose up -d

# ENTER:
# docker compose exec -it container_name bash
# exit

# SPECIFIC:
# docker compose logs -f
# docker compose logs -f container_name

# docker compose restart service_name

# docker compose rm service_name
# docker compose build service_name
# docker compose build --no-cache service_name
# docker compose up -d service_name

# docker inspect service_name

# RUN WITHOUT CMD:
# docker run --rm -it --entrypoint /bin/sh image_name
# to get image_name:
# docker images and under repository so srcs-container_name

# Variables
DOCKER_COMPOSE = docker compose
DOCKER_COMPOSE_FILE = srcs/docker-compose.yml

# Targets

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
	docker volume rm postgres_data srcs_redis_data -f
	docker system prune -f
	docker system prune -a --volumes -f
	sudo rm -rf /home/artclave/data/*

# New target for rebuilding while preserving volumes
re: down
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) rm -f
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down
	# docker system prune -f
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up -d