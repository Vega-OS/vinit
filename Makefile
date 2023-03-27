CC = gcc
LD = ld
CFLAGS = -Werror=implicit -Werror=implicit-function-declaration \
	-Werror=implicit-int -Werror=int-conversion \
	-Werror=incompatible-pointer-types -Werror=int-to-pointer-cast \
	-Werror=return-type -Wunused -pedantic

CFILES = $(shell find src/ -name "*.c")
OBJECTS = $(CFILES:.c=.o)
HEADER_DEPS = $(CFILES:.c=.d)

bin/vinit: $(OBJECTS)
	@ mkdir -p $(shell dirname $@)
	$(LD) $(OBJECTS) -T link-x86_64.ld -o $@

-include $(HEADER_DEPS)
%.o: %.c
	$(CC) -c -MMD $(CFLAGS) -Iinclude/ $< -o $@

.PHONY: clean
clean:
	rm bin/*
	rm $(HEADER_DEPS) $(OBJECTS)
