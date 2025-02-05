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
DOCKER_COMPOSE := $(SRCS)docker-compose.yml  # Use variable for consistency
ENV := $(SRCS).env                     # Use variable for consistency
DATA_DIR := $(HOME)/data                # Good practice to keep this configurable

all: up                                  # Simpler "all" target

up:
        docker compose -p $(NAME) -f $(DOCKER_COMPOSE) --env-file $(ENV) up -d --build

down:
        docker compose -p $(NAME) -f $(DOCKER_COMPOSE) --env-file $(ENV) down

start:
        docker compose -p $(NAME) -f $(DOCKER_COMPOSE) --env-file $(ENV) start

stop:
        docker compose -p $(NAME) -f $(DOCKER_COMPOSE) --env-file $(ENV) stop

clean-images:
        docker images | grep -oE '^[a-f0-9]+' | xargs -I {} docker rmi -f {} || true

clean: down clean-images

fclean: clean
        @echo "Cleaning all configurations in docker and data directory..."
        @rm -rf $(DATA_DIR)
        @docker system prune --all --force --volumes
        @docker system prune --force
        @docker network prune --force

re: fclean all

.PHONY: all up down start stop clean clean-images fclean re
