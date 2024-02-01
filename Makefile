# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: albrusso <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/29 12:46:46 by albrusso          #+#    #+#              #
#    Updated: 2023/06/20 15:54:42 by albrusso         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

################################################################################
#                                  CONFIG                                      #
################################################################################

CLIENT	=	client
SERVER	=	server
CC		=	gcc
CFLAGS	=	-Wall -Werror -Wextra -g
RM		=	rm -f
LIBFT	= libft/libft.a

################################################################################
#                                  COLORS                                      #
################################################################################

GREEN	=	\033[38;5;76m
RED		=	\033[38;5;160m
YELLOW	=	\033[38;5;226m
ORANGE	=	\033[38;5;202m
PURPLE	=	\033[38;5;213m
LBLUE	=	\033[38;5;51m
BLUE	=	\033[38;5;117m
INDI	=	\033[38;5;99m
RESET	=	\033[00m

################################################################################
#                                   FILES                                      #
################################################################################

S_SERVER	=	server.c

S_CLIENT	=	client.c

################################################################################
#                                   MAKE                                       #
################################################################################

O_SERVER	=	$(S_SERVER:.c=.o)

O_CLIENT	=	$(S_CLIENT:.c=.o)

all:		header $(SERVER) $(CLIENT)

header:
	@echo "$(ORANGE)Name:$(RESET)    minitalk"
	@echo "$(ORANGE)Author:  $(RESET)albrusso$(RESET)"
	@echo "$(ORANGE)Version: $(RESET)v 1.0$(RESET)"
	@echo

$(SERVER):	$(O_SERVER)
			@make -C libft
			@$(CC) $(CFLAGS) $(O_SERVER) $(LIBFT) -o $(SERVER)
			@echo "$(BLUE)server $(GREEN)compiled!$(RESET)"

$(CLIENT):	$(O_CLIENT)
			@$(CC) $(CFLAGS) $(O_CLIENT) $(LIBFT) -o $(CLIENT)

clean:
			@make clean -C libft
			@ $(RM) $(O_SERVER)
			@echo "$(BLUE)server objects file $(YELLOW)removed!$(RESET)"
			@ $(RM) $(O_CLIENT)
			@echo "$(BLUE)client objects file $(YELLOW)removed!$(RESET)"


fclean:		clean
			@ $(RM) libft/libft.a
			@echo "$(BLUE)libft.a $(YELLOW)removed!$(RESET)"
			@ $(RM) $(SERVER)
			@echo "$(BLUE)server $(YELLOW)removed!$(RESET)"
			@ $(RM) $(CLIENT)
			@echo "$(BLUE)client $(YELLOW)removed!$(RESET)"

re:			fclean all

PHONY:		all header server client clean fclean re

.SILENT:
