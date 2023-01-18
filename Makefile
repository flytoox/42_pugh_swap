# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: obelaizi <obelaizi@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/15 19:52:17 by obelaizi          #+#    #+#              #
#    Updated: 2023/01/18 22:59:08 by obelaizi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = push_swap
NAME_BONUS = checker
FLAGS = -Wall -Wextra -Werror -g

all : $(NAME)

SRCS = $(wildcard *.c)
OBJS= $(SRCS:.c=.o)

SRCS_BONUS = $(wildcard ./BONUS/*.c ./BONUS/GET_NEXT_LINE/*.c)
OBJS_BONUS= $(SRCS_BONUS:.c=.o)


%.o: %.c push_swap.h
	cc -c $(FLAGS) $<

%_bonus.o: %_bonus.c ./BONUS/checker_bonus.h ./BONUS/GET_NEXT_LINE/get_next_line.h
	cc -c $(FLAGS) $< -o $@
	
$(NAME): $(OBJS)
	cc $(OBJS) -o $(NAME)

bonus: $(OBJS_BONUS)
	cc $(OBJS_BONUS) -o $(NAME_BONUS)
	echo $(SRCS_BONUS)

clean: clean_bonus
	rm -f $(OBJS)

clean_bonus:
	rm -f $(OBJS_BONUS) 

fclean:clean clean_bonus
	rm -f $(NAME)
	rm -f $(NAME_BONUS)

re: fclean all