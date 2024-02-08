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

ENV_FILE	= srcs/.env
DOCKER_FILE	= srcs/docker-compose.yml
COMPOSE		= docker compose -f

#---- rules -----------------------------------------------------------#

.DEFAULT: all

all: debug

up:
	$(COMPOSE) $(DOCKER_FILE) up -d --build

#---- debug -----------------------------------------------------------#
# Removing the -d flag allows us to see the output of the containers.

debug:
	$(COMPOSE) $(DOCKER_FILE) up --build

#---- down ------------------------------------------------------------#

down:
	$(COMPOSE) $(DOCKER_FILE) down

# This will remove:	- all stopped containers \
					- all networks not used by at least one container \
					- all dangling images \
					- unused build cache
prune:
	docker system prune -a --force

#---- clean -----------------------------------------------------------#

clean: down
	$(COMPOSE) $(DOCKER_FILE) down --volumes --rmi all
	docker system prune -a --force

re: down up

#---- phony -----------------------------------------------------------#

.PHONY: all up debug down prune clean re
