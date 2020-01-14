NAME = libmx.a

SRCD = src
INCD = inc
OBJD = obj
INC = libmx.h

SRC = mx_strnew.c \
	mx_strlen.c \
	mx_strncpy.c \
	mx_str_reverse.c \
	mx_strdup.c \
	mx_get_char_index.c \
	mx_swap_char.c \
	mx_strcpy.c \
	mx_sort_list.c \
	mx_list_size.c \
	mx_create_node.c \
	mx_push_front.c \
	mx_push_back.c \
	mx_pop_front.c \
	mx_pop_back.c \
	mx_numlen.c \
	mx_printstr.c \
	mx_atoi.c \
	mx_isspace.c \
	mx_isdigit.c \
	mx_itoa.c \
	mx_strjoin.c \
	mx_strcat.c \
	mx_strcmp.c \
	mx_printspaces.c \
	mx_strstr.c \
	mx_strncmp.c \
	mx_count_substr.c \
	mx_strdel.c \
	mx_del_strarr.c \
	mx_realloc.c \
	mx_memmove.c \
	mx_memcpy.c \
	mx_pr_num_to_hex.c \
	mx_isescape.c \
	mx_hash.c \
	mx_create_map.c \
	mx_put_map.c \
	mx_get_map.c \
	mx_del_map.c \
	mx_binary_search.c \
	mx_bubble_sort.c \
	mx_count_words.c \
	mx_strtrim.c \
	mx_del_extra_spaces.c \
	mx_file_to_str.c \
	mx_get_substr_index.c \
	mx_hex_to_nbr.c \
	mx_nbr_to_hex.c \
	mx_print_unicode.c \
	mx_strncat.c \
	mx_replace_substr.c \
	mx_sqrt.c \
	mx_strsplit.c \
	mx_strndup.c \

INCLUDE = -I $(INCD) \

INCS = $(addprefix $(INCD)/, $(INC))
SRCS = $(addprefix $(SRCD)/, $(SRC))
OBJS = $(addprefix $(OBJD)/, $(SRC:%.c=%.o))

CFLAGS = -std=c11 -Wall -Wextra -Wpedantic -Werror
AR = ar rcs

all: install clean

install: $(NAME)

$(NAME): $(OBJS)
	@$(AR) $@ $^
	@printf "\x1b[32;1m$@ created\x1b[0m\n"

$(OBJD)/%.o: $(SRCD)/%.c $(INCS)
	@$(CC) $(CFLAGS) -c $< -o $@ $(INCLUDE)
	@printf "\x1b[32mcompiled[libmx]: \x1b[0m[$(<:$(SRCD)/%.c=%.c)]\n"

$(OBJS): | $(OBJD)

$(OBJD):
	@mkdir -p $@

uninstall: clean
	@rm -rf $(NAME)
	@printf "\x1b[34;1mdeleted libmx/$(NAME)\x1b[0m\n"

clean:
	@rm -rf $(OBJD)
	@printf "\x1b[34;1mdeleted libmx/$(OBJD)\x1b[0m\n"

reinstall: uninstall install