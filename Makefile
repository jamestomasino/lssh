PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
MANDIR ?= $(PREFIX)/share/man/man1

install:
	@echo Installing the executable to $(BINDIR)
	@mkdir -p $(BINDIR)
	@install -m 755 lssh $(BINDIR)
	@echo Installing the manual page to $(MANDIR)/man1
	@mkdir -p $(MANDIR)
	@install -m 644 lssh.1 $(MANDIR)

uninstall:
	@echo Removing the executable from $(BINDIR)
	@rm -f $(BINDIR)/lssh
	@echo Removing the manual page from $(MANDIR)/man1
	@rm -f $(BINDIR)/man1/lssh.1

.PHONY: install uninstall
