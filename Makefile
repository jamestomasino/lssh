# Install to /usr/local unless otherwise specified, such as `make PREFIX=/app`
PREFIX?=/usr/local

# What to run to install various files
INSTALL?=install
# Run to install the actual binary
INSTALL_PROGRAM=$(INSTALL) -Dm 755
# Run to install application data, with differing permissions
INSTALL_DATA=$(INSTALL) -Dm 644

# Directories into which to install the various files
bindir=$(DESTDIR)$(PREFIX)/bin
sharedir=$(DESTDIR)$(PREFIX)/share

help:
	@echo "targets:"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sed -n 's/^\(.*\): \(.*\)##\(.*\)/  \1|\3/p' \
	| column -t  -s '|'

install: lssh lssh.1 ## system install
	$(INSTALL_PROGRAM) lssh $(bindir)/lssh
	$(INSTALL_DATA) lssh.1 $(sharedir)/man/man1/lssh.1

uninstall: ## system uninstall
	rm -f $(bindir)/lssh
	rm -f $(sharedir)/man/man1/lssh.1

.PHONY: install uninstall
