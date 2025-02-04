# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rtijani <rtijani@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/16 09:39:59 by rtijani           #+#    #+#              #
#    Updated: 2025/01/17 12:38:10 by rtijani          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = inception
SRCS = ./srcs/
DOCKER_COMPOSE := ./srcs/docker-compose.yml
ENV := srcs/.env
DATA_DIR := $(HOME)/data

all:
	docker compose -f ./srcs/docker-compose.yml up -d --build
up:
	docker compose -p $(NAME) -f $(COMPOSE) up --env-file $(ENV) -d

down:
	docker compose -f ./srcs/docker-compose.yml --env-file $(ENV) down

start:
	docker compose -p $(NAME) start

stop:
	docker compose -p $(NAME) stop

clean-images:
	docker rmi -f $$(docker images -q) || true

clean: down clean-images

fclean: clean
	echo "cleaning all configurations in docker"
	@sudo rm -rf /home/rtijani/data
	@docker system prune --all --force --volumes
	@docker system prune
	@docker network prune --force
	@sudo rm -rf /home/rtijani/data/mariadb/*
	@sudo rm -rf /home/rtijani/data/wordpress/*

re: fclean all

.PHONY: all re down clean
