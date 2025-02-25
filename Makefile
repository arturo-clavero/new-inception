DOCKER_COMPOSE = docker compose
DOCKER_COMPOSE_FILE = srcs/docker-compose.yml
VOLUME_DATABASE = /home/artclave/data/database
VOLUME_WEBSITE = /home/artclave/data/website
define make_missing_dir
	if [ ! -d "$(1)" ]; then \
		sudo mkdir -p "$(1)"; \
		echo "Missing dir - created $(1)"; \
	fi ; \
	sudo chmod 777 $(1)
endef

define is_input_valid
	if [ -z "$(strip $(2))" ]; then \
		echo "Invalid input: cannot be empty"; \
	elif [ ! -z "$(strip $(5))" ] && echo $(2) | grep -iqE "$(5)" ; then \
		echo "Invalid input: must not contain $(5)"; \
	elif [ ! -z "$(strip $(4))" ] && ! echo $(2) | grep -qE "^($(4))$$" ; then \
		echo "Invalid input: must be $(4)"; \
	else \
		echo ""; \
		echo "$(3)$(2)" >> $(1); \
	fi
endef

define is_input_valid2
	if [ -z "$(strip $(2))" ]; then \
		if $(5) == "old"; then \
			sed -i '/^$(3)$$/d' $(1); \
		else \
			echo "Invalid input: cannot be empty"; \
		fi; \
	elif [ ! -z "$(strip $(5))" ] && echo $(2) | grep -iqE "$(5)" ; then \
		if $(5) == "old"; then \
			sed -i '/^$(3)$$/d' $(1); \
		else \
			echo "Invalid input: must not contain $(5)"; \
		fi; \
	elif [ ! -z "$(strip $(4))" ] && ! echo $(2) | grep -qE "^($(4))$$" ; then \
		echo "Invalid input: must be $(4)"; \
	else \
		echo ""; \
		if $(5) == "new"; then \
			echo "$(3)$(2)" >> $(1); \
		fi
	fi
endef

define set_missing_value2
	if [ ! -f "$(1)" ]; then \
			sudo touch "$(1)"; \
			echo "Missing file - created $(1)"; \
	fi; \
	sudo chmod 777 $(1); \
	if [ -z "$(strip $(2))" ]; then \
		echo "there is 2 ..."; \
		if grep -i "^DOMAIN_NAME=" $(1); then \
			value=$(grep -i "^DOMAIN_NAME=" $(1) | cut -d'=' -f2); \
			$(call is_input_valid2,$(1),$$value,$(2),$(3),$(4), "old"); \
		fi; \
	if ! grep -Pq "^$(2)=.+$$" $(1) || ([ -z "$2"] && [ ! -s $(1)]); then \
		grep -iq "^$(2)$$" $(1) && sed -i '/^$(2)$$/d' $(1) && echo "Exists and deleted 1"; \
		grep -iq "^$(shell echo $(2) | sed 's/.$$//')$$" $(1) && sed -i "/^$(shell echo $(2) | sed 's/.$$//')$$/d" $(1) && echo "2 Exists and deleted"; \
		while ! grep -Pq "^$(2).+$$" $(1); do \
			if echo $(1) | grep -q ".txt" && [ -z "$(strip $(2))" ]; then \
				echo "Please enter a value for missing $(basename $(1) .txt)"; \
			else \
				echo "Please enter a value for missing env $2"; \
			fi ; \
			read user_input; \
			$(call is_input_valid2,$(1),$$user_input,$(2),$(3),$(4), "new");\
		done; \
	fi
endef

all: build up

define set_missing_value
	if [ ! -f "$(1)" ]; then \
			sudo touch "$(1)"; \
			echo "Missing file - created $(1)"; \
	fi; \
	sudo chmod 777 $(1); \
	if ! grep -Pq "^$(2)=.+$$" $(1) || ([ -z "$2"] && [ ! -s $(1)]); then \
		grep -iq "^$(2)$$" $(1) && sed -i '/^$(2)$$/d' $(1) && echo "Exists and deleted 1"; \
		grep -iq "^$(shell echo $(2) | sed 's/.$$//')$$" $(1) && sed -i "/^$(shell echo $(2) | sed 's/.$$//')$$/d" $(1) && echo "2 Exists and deleted"; \
		while ! grep -Pq "^$(2).+$$" $(1); do \
			if echo $(1) | grep -q ".txt" && [ -z "$(strip $(2))" ]; then \
				echo "Please enter a value for missing $(basename $(1) .txt)"; \
			else \
				echo "Please enter a value for missing env $2"; \
			fi ; \
			read user_input; \
			$(call is_input_valid,$(1),$$user_input,$(2),$(3),$(4));\
		done; \
	fi
endef

test:
#ADD EMAIL STUFF
# grep -q "^ADMINTEST=" ./srcs/.env && sed -i '/^ADMINTEST=$$/d' $(1)
	@$(call set_missing_value2,./srcs/.env,ADMINTEST=,,admin)

build:
	@$(call make_missing_dir,$(VOLUME_DATABASE))
	@$(call make_missing_dir,$(VOLUME_WEBSITE))
	@$(call make_missing_dir,./secrets)
	@$(call set_missing_value,./srcs/.env,DOMAIN_NAME=)
	@$(call set_missing_value,./secrets/db_root_password.txt)
	@$(call set_missing_value,./secrets/credentials.txt,DATABASE_NAME=)
	@$(call set_missing_value,./secrets/credentials.txt,DATABASE_ADMIN=,,admin)
	@$(call set_missing_value,./secrets/db_password.txt)
	@$(call set_missing_value,./secrets/credentials.txt,WORDPRESS_ADMIN_USERNAME=)
	@$(call set_missing_value,./secrets/credentials.txt,WORDPRESS_ADMIN_PASSWORD,,$(shell grep "^WORDPRESS_ADMIN_USERNAME=" ./secrets/credentials.txt | awk -F= '{print $$2}'))
	@$(call set_missing_value,./secrets/credentials.txt,WORDPRESS_ADMIN_EMAIL=)
	@$(call set_missing_value,./srcs/.env,WORDPRESS_USER2_ROLE=,subscriber|editor|admin|author)
	@$(call set_missing_value,./secrets/credentials.txt,WORDPRESS_USER2_USERNAME=)
	@$(call set_missing_value,./secrets/credentials.txt,WORDPRESS_USER2_EMAIL=)
	@$(call set_missing_value,./secrets/credentials.txt,WORDPRESS_USER2_PASSWORD=,,$(shell grep "^WORDPRESS_USER2_USERNAME=" ./secrets/credentials.txt | awk -F= '{print $$2}'))
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
	sudo rm -rf $(VOLUME_DATABASE)
	sudo rm -rf $(VOLUME_WEBSITE)

