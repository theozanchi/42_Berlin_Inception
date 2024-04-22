# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tzanchi <tzanchi@student.42berlin.de>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/26 10:42:16 by tzanchi           #+#    #+#              #
#    Updated: 2024/04/22 19:33:48 by tzanchi          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Directories
SRCS		=	./srcs
SECRETS		=	$(SRCS)/secrets
MARIADB		=	mariadb
NGINX		=	nginx
WORDPRESS	=	wordpress

# Colours, symbols and utils
GREEN		=	\033[1;32m
CYAN		=	\033[1;36m
BLUE		=	\033[1;34m
YELLOW		=	\033[1;33m
RED			=	\033[1;31m
NC			=	\033[0m
BOLD		=	\033[1m
TICK		=	✓

all:			project_logo secrets up

up:
				@docker compose -f ./srcs/compose.yaml up -d

down:
				@docker compose -f ./srcs/compose.yaml down

prune:
				@docker system prune -af

re:				down prune up

secrets:		
				@if [ ! -d $(SECRETS) ]; \
					then mkdir $(SECRETS); \
				fi
				@if [ ! -d $(SECRETS)/$(MARIADB) ]; \
					then mkdir $(SECRETS)/$(MARIADB); \
					echo -n "$(CYAN)Generating MariaDB secrets... $(NC)"; \
					openssl rand -base64 12 | tr -d '\n' > $(SECRETS)/$(MARIADB)/mariadb_pwd.secret; \
					openssl rand -base64 12 | tr -d '\n' > $(SECRETS)/$(MARIADB)/mariadb_root_pwd.secret; \
					echo "$(GREEN)Done!$(NC)"; \
				fi
				@if [ ! -d $(SECRETS)/$(WORDPRESS) ]; \
					then mkdir $(SECRETS)/$(WORDPRESS); \
					echo -n "$(CYAN)Generating Wordpress secrets... $(NC)"; \
					openssl rand -base64 12 | tr -d '\n' > $(SECRETS)/$(WORDPRESS)/wp_admin_pwd.secret; \
					openssl rand -base64 12 | tr -d '\n' > $(SECRETS)/$(WORDPRESS)/wp_user_pwd.secret; \
					echo "$(GREEN)Done!$(NC)"; \
				fi

delete_secrets:
				@if [ -d $(SECRETS) ]; \
					then rm -rf $(SECRETS); \
					echo "$(RED)Secrets deleted!$(NC)"; \
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

.PHONY:			all up down prune re secrets delete_secrets project_logo
