CC     ?= gcc
CFLAGS ?= -std=c11 -Wall -Wextra -g

.PHONY: all run clean

all: tetris_stack

tetris_stack: src/tetris_stack.c
	$(CC) $(CFLAGS) -o $@ $^

run: tetris_stack
	./tetris_stack

clean:
	rm -f tetris_stack tetris_stack.exe
