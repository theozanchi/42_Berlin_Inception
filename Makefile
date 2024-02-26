# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tzanchi <tzanchi@student.42berlin.de>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/26 10:42:16 by tzanchi           #+#    #+#              #
#    Updated: 2024/02/26 10:44:45 by tzanchi          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#Compiler targets and libraries
CC			=	c++
CFLAGS		=	-Wall -Wextra -Werror -std=c++98
CFLAGS		+=	-I$(patsubst %/,%,$(patsubst ./%,%,$(SRCS_DIR)))
NAME		=	PmergeMe

# Directories
SRCS_DIR	=	./src/
INCS_DIR	=	./inc/
OBJ_DIR		=	./obj/

# Colours, symbols and utils
GREEN		=	\033[1;32m
CYAN		=	\033[1;36m
YELLOW		=	\033[1;33m
RED			=	\033[1;31m
NC			=	\033[0m
BOLD		=	\033[1m
TICK		=	✓

SRC			=	main.cpp

SRCS		=	$(addprefix ${SRCS_DIR}, ${SRC})
SRC_NR		=	$(words ${SRCS})

OBJS		=	$(patsubst ${SRCS_DIR}%, ${OBJ_DIR}/%, $(SRCS:.cpp=.o))

all:			project_logo ${NAME}

${NAME}:		${OBJS}
				@${CC} ${CFLAGS} ${OBJS} -o ${NAME}
				@echo "${YELLOW}\nCompilation complete, ${NAME} executable at the root of the directory${NC}\n"

$(OBJ_DIR)/%.o:	$(SRCS_DIR)%.cpp
				@mkdir -p $(dir $@)
				@printf "Compiling $(notdir $<)"; \
				${CC} ${CFLAGS} -I${INCS_DIR} -c $< -o $@; \
				printf "${GREEN}"; \
				printf " ${TICK}\n"; \
				printf "${NC}"; 

clean:
				@if [ ! -d "${OBJ_DIR}" ]; \
				then \
					echo "Repo already clean"; \
				else \
					echo "Removing all .o files"; \
					rm -r ${OBJ_DIR}; \
				fi

fclean:			clean
				@echo "Removing executable from root"
				@rm -f ${NAME}

re:				fclean
				@echo "\n${GREEN}COMPILING WITHOUT DEBUG FLAG${NC}\n"
				@make --no-print-directory all


go:				all
				@./${NAME} `shuf -i 1-1000 -n 3000 | tr "\n" " " `

vgo:			all
				valgrind -s --leak-check=full ./${NAME} `shuf -i 1-1000 -n 3000 | tr "\n" " " `

debug:			fclean
				$(eval CFLAGS += -g)
				@echo "\n${GREEN}COMPILING WITH DEBUG FLAG${NC}\n"
				@make --no-print-directory all

project_logo:
				@echo "${RED}   ___     _     _________     _     ____"
				@echo "  /   \   / \   /         \   / \   /    \ "
				@echo " ( ${CYAN}C++${RED} ) ( - ) ( ${CYAN}Module_09${RED} ) ( - ) ( ${CYAN}ex01${RED} )"
				@echo "  \___/   \_/   \_________/   \_/   \____/${NC}"
				@echo "\n               ${NC}a 42 project by ${BOLD}Théo Zanchi${NC}\n"
