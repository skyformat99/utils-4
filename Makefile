# This Makefile is generated by omake: https://github.com/ouonline/omake.git

CC := gcc
AR := ar

ifeq ($(debug), y)
	CFLAGS := -g
else
	CFLAGS := -O2 -DNDEBUG
endif
CFLAGS := $(CFLAGS) -Wall -Werror -Wextra -fPIC

TARGET := libutils.a libutils.so

.PHONY: all clean

all: $(TARGET)

utils_OBJS := ./str_utils.c.utils.o ./rbtree.c.utils.o ./hash.c.utils.o ./time_utils.c.utils.o

utils_INCLUDE :=

utils_LIBS :=

./str_utils.c.utils.o: ./str_utils.c
	$(CC) $(CFLAGS) $(utils_INCLUDE) -c $< -o $@

./rbtree.c.utils.o: ./rbtree.c
	$(CC) $(CFLAGS) $(utils_INCLUDE) -c $< -o $@

./hash.c.utils.o: ./hash.c
	$(CC) $(CFLAGS) $(utils_INCLUDE) -c $< -o $@

./time_utils.c.utils.o: ./time_utils.c
	$(CC) $(CFLAGS) $(utils_INCLUDE) -c $< -o $@

libutils.a: $(utils_OBJS)
	$(AR) rc $@ $^

libutils.so: $(utils_OBJS)
	$(CC) -shared -o $@ $^ $(utils_LIBS)

clean:
	rm -f $(TARGET) $(utils_OBJS)
