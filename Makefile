# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: twang <twang@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/02 20:24:37 by wangthea          #+#    #+#              #
#    Updated: 2024/02/06 15:17:01 by twang            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

include srcs/.env

#---- variables -------------------------------------------------------#

ENV_FILE	= srcs/.env
DOCKER_FILE	= srcs/docker-compose.yml
COMPOSE		= docker compose -f

#---- rules -----------------------------------------------------------#

.DEFAULT: all

all: volumes debug

up: volumes
	$(COMPOSE) $(DOCKER_FILE) up -d --build

volumes:
	mkdir -p $(WP_VOLUME_PATH)
	mkdir -p $(MARIADB_VOLUME_PATH)

#---- debug -----------------------------------------------------------#
# Removing the -d flag allows us to see the output of the containers.

debug: volumes
	$(COMPOSE) $(DOCKER_FILE) up --build

#---- down ------------------------------------------------------------#

down:
	$(COMPOSE) $(DOCKER_FILE) down

# This will remove:	- all stopped containers \
					- all networks not used by at least one container \
					- all dangling images \
					- unused build cache
prune:
	docker system prune -a

#---- clean -----------------------------------------------------------#

clean: down
	$(COMPOSE) -f $(DOCKER_FILE) down --volumes --rmi all

re: down up

#---- phony -----------------------------------------------------------#

.PHONY: all up debug down prune clean re volumes
