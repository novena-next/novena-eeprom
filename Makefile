SOURCES=novena-eeprom.c
OBJECTS=$(SOURCES:.c=.o)
EXEC=novena-eeprom
CFLAGS ?= -Wall
PREFIX ?= /usr/local
DESTDIR ?=

all: $(OBJECTS)
	$(CC) $(LIBS) $(LDFLAGS) $(OBJECTS) -o $(EXEC)

clean:
	rm -f $(EXEC) $(OBJECTS)

.c.o: novena_eeprom.h
	$(CC) -c $(CFLAGS) $< -o $@

install: all
	install -d $(DESTDIR)$(PREFIX)/bin
	install -d $(DESTDIR)$(PREFIX)/share/man/man8
	install -m 0755 $(EXEC) $(DESTDIR)$(PREFIX)/bin
	install -m 0644 novena-eeprom.8 $(DESTDIR)$(PREFIX)/share/man/man8

.PHONY: install
