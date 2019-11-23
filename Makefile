PREFIX=/usr/local
BINDIR=$(PREFIX)/bin
DATADIR=$(PREFIX)/share
MANDIR=$(DATADIR)/man/man1
IGALDIR=$(DATADIR)/igal2

OLDLIBDIR=$(PREFIX)/lib/igal

clean::
	rm -rf $(DESTDIR)$(IGALDIR)
	rm -f $(DESTDIR)$(BINDIR)/igal2
	rm -f $(DESTDIR)$(BINDIR)/igal
	rm -f $(DESTDIR)$(MANDIR)/igal2.1
	rm -f $(DESTDIR)$(BINDIR)/igal2.sh	

old-clean::
	rm -rf $(DESTDIR)$(OLDLIBDIR)
	rm -f $(DESTDIR)$(BINDIR)/igal
	rm -f $(DESTDIR)$(MANDIR)/igal.1

install:: igal2
	install -d $(DESTDIR)$(BINDIR)
	install -m 0755 igal2 $(DESTDIR)$(BINDIR)
	ln -si igal2 $(DESTDIR)$(BINDIR)/igal
	install -m 0755 utilities/igal2.sh $(DESTDIR)$(BINDIR)
	install -d $(DESTDIR)$(MANDIR)
	install -m 0644 igal2.1 $(DESTDIR)$(MANDIR)
	install -d $(DESTDIR)$(IGALDIR)
	install -m 0644 README ChangeLog COPYING indextemplate2.html slidetemplate2.html tile.png igal2.css directoryline2.html $(DESTDIR)$(IGALDIR)
	sed -i 's_/usr/local_$(PREFIX)_' $(DESTDIR)$(BINDIR)/igal2 $(DESTDIR)$(MANDIR)/igal2.1
