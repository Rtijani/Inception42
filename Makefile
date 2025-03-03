all:
	@mkdir -p /home/rtijani/data/wordpress
	@mkdir -p /home/rtijani/data/mariadb
	@mkdir -p /home/rtijani/data/redis
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down : 
	@docker-compose -f ./srcs/docker-compose.yml down

stop : 
	@docker-compose -f ./srcs/docker-compose.yml stop

start : 
	@docker-compose -f ./srcs/docker-compose.yml start

status : 
	@docker ps

clean: down
	@printf "Cleaning configuration ${name}...\n"
	@docker system prune -a
	@sudo rm -rf ~/data/mariadb/*
	@sudo rm -rf ~/data/wordpress/*

fclean:
	@printf "Total clean of all configurations docker\n"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

re: down all

.PHONY: all down re
