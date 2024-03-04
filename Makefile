# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tzanchi <tzanchi@student.42berlin.de>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/26 10:42:16 by tzanchi           #+#    #+#              #
#    Updated: 2024/03/04 12:45:22 by tzanchi          ###   ########.fr        #
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

all:			project_logo up

up:
				@docker compose -f ./srcs/compose.yaml up -d

down:
				@docker compose -f ./srcs/compose.yaml down

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
