DESTDIR   := ~
PREFIX    := .local

install:
	mkdir -p $(DESTDIR)/$(PREFIX)/bin
	install -m 0700 mrandr $(DESTDIR)/$(PREFIX)/bin/mrandr
	install -m 0600 mrandr-xrandr-parser.sed $(DESTDIR)/$(PREFIX)/bin/mrandr-xrandr-parser.sed

uninstall:
	rm -rf $(DESTDIR)/$(PREFIX)/bin/mrandr $(DESTDIR)/$(PREFIX)/bin/mrandr-xrandr-parser.sed
