# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: twang <twang@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/02 20:24:37 by wangthea          #+#    #+#              #
#    Updated: 2024/02/08 10:32:15 by twang            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


.SILENT:

#---- variables -------------------------------------------------------#

include srcs/.env

COMPOSE		= docker compose -f
# create the images from the dockerfiles \
option -f allow specifying the path of the docker-compose file

DOCKER_FILE	= srcs/docker-compose.yml

#---- rules -----------------------------------------------------------#

.DEFAULT: all

all: volumes
	$(COMPOSE) $(DOCKER_FILE) up -d --build
# create the images from the dockerfiles, then create the containers from \
the images, then start the containers.

up: volumes
	$(COMPOSE) $(DOCKER_FILE) up -d
# create the containers from the images, then start the containers.

build: volumes
	$(COMPOSE) $(DOCKER_FILE) build
# create the images from the dockerfiles

volumes:
	mkdir -p $(WORDPRESS_VOLUME)
	mkdir -p $(MARIADB_VOLUME)

#---- debug -----------------------------------------------------------#

debug: volumes
	$(COMPOSE) $(DOCKER_FILE) up --build
# Removing the -d flag allows us to see the output of the containers.

nginx:
	$(COMPOSE) $(DOCKER_FILE) exec nginx bash
# create nginx container then open it

mariadb:
	$(COMPOSE) $(DOCKER_FILE) exec mariadb bash

wordpress:
	$(COMPOSE) $(DOCKER_FILE) exec wordpress bash

#---- down ------------------------------------------------------------#

down:
	$(COMPOSE) $(DOCKER_FILE) down

prune:
	docker stop $$(docker ps -qa);
	docker system prune -a --force;
	docker volume prune -a --force;
# This will remove:	- all stopped containers \
					- all networks not used by at least one container \
					- all dangling images \
					- unused build cache

#---- clean -----------------------------------------------------------#

clean: down
	$(COMPOSE) $(DOCKER_FILE) down --volumes --rmi all
	rm -rf $(WORDPRESS_VOLUME) $(MARIADB_VOLUME)

fclean:
	docker stop $$(docker ps -qa);
	docker rm $$(docker ps -qa);
	docker rmi -f $$(docker images -qa);
	docker volume rm $$(docker volumes ls -q);
	docker network rm $$(docker network ls -q) 2>/dev/null

re: down up

#---- phony -----------------------------------------------------------#

.PHONY: all up build volumes debug down prune clean re
