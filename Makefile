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

#---- variables -------------------------------------------------------#

ENV_FILE = srcs/.env
DOCKER_FILE = srcs/docker-compose.yml
COMPOSE = docker compose -f

#---- rules -----------------------------------------------------------#

.DEFAULT: all

all: debug

up:
	$(COMPOSE) $(DOCKER_FILE) up --build

#---- debug -----------------------------------------------------------#
# Removing the -d flag allows us to see the output of the containers.

debug:
	$(COMPOSE) $(DOCKER_FILE) up --build

#---- down ------------------------------------------------------------#

down:
	$(COMPOSE) $(DOCKER_FILE) down

#---- clean -----------------------------------------------------------#

clean: down
	$(COMPOSE) -f $(DOCKER_FILE) down --volumes --rmi all

re: down up

#---- phony -----------------------------------------------------------#

.PHONY: all up debug down clean re
