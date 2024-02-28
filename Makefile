# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tzanchi <tzanchi@student.42berlin.de>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/26 10:42:16 by tzanchi           #+#    #+#              #
#    Updated: 2024/02/28 10:50:11 by tzanchi          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Directories
MARIADB		=	./srcs/requirements/mariadb
NGINX		=	./srcs/requirements/nginx
WORDPRESS	=	./srcs/requirements/wordpress

# Colours, symbols and utils
GREEN		=	\033[1;32m
CYAN		=	\033[1;36m
BLUE		=	\033[1;34m
YELLOW		=	\033[1;33m
RED			=	\033[1;31m
NC			=	\033[0m
BOLD		=	\033[1m
TICK		=	✓

all:			project_logo

build_nginx:
				@docker build -t my-nginx $(NGINX)

run_nginx:
				@docker run -d my-nginx

stop_nginx:
				@CONTAINERS=$$(docker ps -q --filter ancestor=my-nginx); \
				if [ -n "$$CONTAINERS" ]; then \
					docker stop $$CONTAINERS; \
				else \
					echo "No running my-nginx container"; \
				fi

project_logo:
				@echo "\n$(BOLD)                              ##        $(BLUE).$(NC)"
				@echo "$(BOLD)                        ## ## ##       $(BLUE)==$(NC)"
				@echo "$(BOLD)                 ## ## ## ## ##      $(BLUE)===$(NC)"
				@echo "$(BLUE)             /\"\"\"\"\"\"\"\"\"\"\"\"\"\"\___/ ===$(NC)"
				@echo "$(CYAN)        ~~~ $(BLUE){$(CYAN)~~ ~~~~ ~~~ ~~~~ ~~ ~ $(BLUE)/  ===- $(CYAN)~~~$(NC)"
				@echo "$(BLUE)             \______ $(NC)$(BOLD)o          $(BLUE)__/$(NC)"
				@echo "$(BOLD)               \    $(BLUE)\        __/$(NC)"
				@echo "$(BOLD)                \____$(BLUE)\______/$(NC)"
				@echo "\n\n\t\t$(BOLD)INCEPTION$(NC), a 42 project by ${BOLD}Théo Zanchi${NC}\n"
