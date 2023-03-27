CC = gcc
LD = ld
CFLAGS = -Werror=implicit -Werror=implicit-function-declaration \
	-Werror=implicit-int -Werror=int-conversion \
	-Werror=incompatible-pointer-types -Werror=int-to-pointer-cast \
	-Werror=return-type -Wunused -pedantic
ROOT_DIR = ./

CFILES = $(shell find $(ROOT_DIR/src/) -name "*.c")
OBJECTS = $(CFILES:.c=.o)
HEADER_DEPS = $(CFILES:.c=.d)

$(ROOT_DIR)/bin/vinit: $(OBJECTS)
	@ mkdir -p $(shell dirname $@)
	$(LD) $(OBJECTS) -T $(ROOT_DIR)/link-x86_64.ld -o $@

-include $(HEADER_DEPS)
%.o: %.c
	$(CC) -c -MMD $(CFLAGS) -I$(ROOT_DIR)/include/ $< -o $@

.PHONY: clean
clean:
	rm $(ROOT_DIR)/bin/*
	rm $(HEADER_DEPS) $(OBJECTS)
