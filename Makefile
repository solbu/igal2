############################################################################
# if you change this, please also modify the value at the top of igal code
DESTDIR=/usr/local
############################################################################

BINDIR=$(DESTDIR)/bin
MANDIR=$(DESTDIR)/man/man1
LIBDIR=$(DESTDIR)/lib/igal2

OLDLIBDIR=$(DESTDIR)/lib/igal

clean::
	rm -rf $(LIBDIR)
	rm -f $(BINDIR)/igal2
	rm -f $(BINDIR)/igal
	rm -f $(MANDIR)/igal2.1
	rm -f $(BINDIR)/igal2.sh	

old-clean::
	rm -rf $(OLDLIBDIR)
	rm -f $(BINDIR)/igal
	rm -f $(MANDIR)/igal.1

install:: igal2
	install -d $(BINDIR)
	install -m 0755 igal2 $(BINDIR)
	ln -si $(BINDIR)/igal2 $(BINDIR)/igal
	install -m 0755 utilities/igal2.sh $(BINDIR)
	install -d $(MANDIR)
	install -m 0644 igal2.1 $(MANDIR)
	install -d $(LIBDIR)
	install -m 0644 README ChangeLog COPYING indextemplate2.html slidetemplate2.html tile.png igal2.css directoryline2.html $(LIBDIR)
