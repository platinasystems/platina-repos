INSTALL=/usr/bin/install

APTKEY=platina_io_goes_debian_keyring.gpg
KEYRING=platina-keyring.gpg

SOURCE=platina_io_goes_debian.list

GPG=/usr/bin/gpg --no-default-keyring --keyring ./$(KEYRING)

all: platina-keys platina-sources

platina-keys:
	rm -f $(APTKEY) $(KEYRING)
	$(GPG) --import gpg/*.key
	$(GPG) --export > $(APTKEY)

platina-sources:
	echo "deb https://platina.io/goes/debian stretch main" > $(SOURCE)

install:
#	$(INSTALL) -d $(DESTDIR)/etc/apt/sources.list.d
#	$(INSTALL) -d $(DESTDIR)/etc/apt/trusted.gpg.d
#	$(INSTALL) -m 0444 $(SOURCE) $(DESTDIR)/etc/apt/sources.list.d
#	$(INSTALL) -m 0444 $(APTKEY) $(DESTDIR)/etc/apt/trusted.gpg.d

clean: 
	rm -f $(APTKEY) $(KEYRING)

distclean:
	rm -f debian/debhelper-build-stamp debian/files debian/*.substvars
	rm -rf debian/.debhelper debian/platina-archive-keyring

bindeb-pkg:
	debuild -us -uc --lintian-opts --profile debian

.PHONY: platina-keys platina-sources install clean distclean bindeb-pkg
