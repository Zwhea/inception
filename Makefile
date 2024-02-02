# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wangthea <wangthea@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/02 20:24:37 by wangthea          #+#    #+#              #
#    Updated: 2024/02/02 20:45:27 by wangthea         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#---- variables -------------------------------------------------------#

ENV_FILE = .env
DOCKER_FILE = ./srcs/docker-compose.yml
COMPOSE = docker compose -f

#---- rules -----------------------------------------------------------#

.DEFAULT: all

all: debug

up:
	$(COMPOSE) $(DOCKER_FILE) --env-file $(ENV_FILE) up -d --build

#---- debug -----------------------------------------------------------#
# Removing the -d flag allows us to see the output of the containers.

debug:
	$(COMPOSE) $(DOCKER_FILE) --env-file $(ENV_FILE) up --build

#---- stop ------------------------------------------------------------#

stop:
	$(COMPOSE) $(DOCKER_FILE) --env-file $(ENV_FILE) down

#---- clean -----------------------------------------------------------#

clean: stop
	$(COMPOSE) -f $(DOCKER_FILE) down --volumes --rmi all

re: stop up

#---- phony -----------------------------------------------------------#

.PHONY: all up debug stop clean re
