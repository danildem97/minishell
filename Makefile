NAME = minishell
LIB_F = libft
LIB = libft.a
SRC = src
OBJ = obj
INC = inc
CFLAGS = -Wall -Wextra -Werror -g -I $(INC)
DEBUG_SEG_FAULTS = -fsanitize=address #for segfault checking
RM = rm -rf
CC = gcc
SRCS = main.c utils.c lexer.c expander.c find_env.c env.c pwd.c redirection.c executor.c \
		cd.c export.c exit.c echo.c unset.c free.c error.c \
		signals.c handle.c executor2.c expander2.c redirection2.c lexer2.c export2.c \
		utils2.c lexer3.c redirection3.c
OBJS = $(SRCS:.c=.o)

all: $(NAME)

$(NAME): $(OBJS) $(LIB_F)/$(LIB)
	@$(CC) $(CFLAGS) $(DEBUG_SEG_FAULTS) $(OBJS) $(LIB_F)/$(LIB) -o $(NAME)  -lreadline

$(LIB_F)/$(LIB):
	@make -C $(LIB_F)
	@echo "libft is done!"

clean:
	@$(RM) $(OBJS)
	@rm -rf obj
	@echo "successfuly cleaned"

fclean: clean
	@$(RM) $(NAME)
	@make fclean -C $(LIB_F)
	@echo "executable removed successfuly"

re: fclean all
