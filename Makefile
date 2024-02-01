# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wangthea <wangthea@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/16 12:29:17 by twang             #+#    #+#              #
#    Updated: 2024/02/01 20:48:44 by wangthea         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPOSE = srcs/docker-compose.yml

all : up

up :
	@ docker-compose -f $(COMPOSE) up -d --build

down :
	@ docker-compose -f $(COMPOSE) down

clean: down
	sh srcs/tools/clean.sh

fclean: down
	sh srcs/tools/delete_all.sh

prune:
	docker system prune -a --force

.PHONY: all up down clean fclean prune
