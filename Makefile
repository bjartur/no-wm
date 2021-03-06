PREFIX = /usr/local/
SRC = x-session.c 
X11SRC = x-move-resize.c x-alt-tab.c 

CC = gcc
CFLAGS = -O2 -Wall
X11LIB = -lX11 -L/usr/X11/lib

BIN = ${SRC:.c=}
X11BIN = ${X11SRC:.c=}
all: $(BIN) $(X11BIN)

$(BIN): %: %.c
	$(CC) $(CFLAGS) $^ -o $@

$(X11BIN): %: %.c
	$(CC) $(CFLAGS) $(X11LIB) $^ -o $@

clean:
	rm $(BIN) $(X11BIN) 

install:
	install -m 0755 $(BIN) $(X11BIN) ${PREFIX}/bin/.
