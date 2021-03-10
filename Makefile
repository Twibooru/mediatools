RM      := rm -f
CFLAGS  := -O3 -Wall -Wextra -pedantic -D_FORTIFY_SOURCE=1 -fpic -Isrc
LIBS    := -lavformat -lavutil -lavcodec -lswscale
LDFLAGS :=
INSTALL ?= install
PREFIX  ?= /usr/local

COMMON_OBJECTS     := build/common.o build/validation.o build/png.o build/stat.o build/thumb.o
MEDIASTAT_OBJECTS  := build/mediastat.o
MEDIATHUMB_OBJECTS := build/mediathumb.o

# Phony rules
.PHONY: all mediastat clean

all: mediastat mediathumb lib

install: all
	$(INSTALL) build/mediastat $(PREFIX)/bin/mediastat
	$(INSTALL) build/mediathumb $(PREFIX)/bin/mediathumb
	$(INSTALL) build/libmediatools.so $(PREFIX)/lib/libmediatools.so

uninstall:
	$(RM) $(PREFIX)/bin/mediastat
	$(RM) $(PREFIX)/bin/mediathumb
	$(RM) $(PREFIX)/lib/libmediatools.so

mediastat: build/mediastat

mediathumb: build/mediathumb

lib: build/libmediatools.so

build/libmediatools.so: $(COMMON_OBJECTS)
	$(CC) -shared $^ $(LDFLAGS) $(LIBS) -o $@

clean:
	$(RM) $(COMMON_OBJECTS) $(MEDIASTAT_OBJECTS)$(MEDIATHUMB_OBJECTS)

# Build rules
build/mediastat: $(COMMON_OBJECTS) $(MEDIASTAT_OBJECTS)
	$(CC) $^ $(LDFLAGS) $(LIBS) -o $@

build/mediathumb: $(COMMON_OBJECTS) $(MEDIATHUMB_OBJECTS)
	$(CC) $^ $(LDFLAGS) $(LIBS) -o $@

build/%.o: src/%.c
	$(CC) $(CFLAGS) -MMD -c $< -o $@

# Declare dependencies
-include $(COMMON_OBJECTS:.o=.d)
-include $(MEDIASTAT_OBJECTS:.o=.d)
