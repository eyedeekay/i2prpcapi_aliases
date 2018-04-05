
INSTALL_PATH ?= /usr/local/bin

install:
	mkdir -p /usr/lib/i2prpccurl/
	install -m755 lib/i2prpccurl/aliases.sh /usr/lib/i2prpccurl/aliases.sh
	install -m755 bin/auth.sh /usr/lib/i2prpccurl/auth.sh
	install -m755 bin/routerinfodump.sh /usr/lib/i2prpccurl/routerinfodump.sh
	install -m755 bin/tunneldump.sh /usr/lib/i2prpccurl/tunneldump.sh
	mkdir -p /etc/i2prpc
	install -m755 etc/i2prpc/i2prpc.conf /etc/i2prpc
	ln -sfv /usr/lib/i2prpccurl/auth.sh "$(INSTALL_PATH)"/i2prpcauth
	ln -sfv /usr/lib/i2prpccurl/routerinfodump.sh "$(INSTALL_PATH)"/routerinfodump
	ln -sfv /usr/lib/i2prpccurl/tunneldump.sh "$(INSTALL_PATH)"/tunneldump

remove:
	rm -rf /usr/lib/i2prpccurl/*.sh \
		/etc/i2prpc/i2prpc.conf \
		"$(INSTALL_PATH)"/i2prpcauth \
		"$(INSTALL_PATH)"/routerinfodump \
		"$(INSTALL_PATH)"/tunneldump \
		/usr/bin/i2prpcauth \
		/usr/bin/routerinfodump \
		/usr/bin/tunneldump

deb:
	checkinstall --install=no --fstrans=yes --default \
		--pkgname="i2prpccurl" \
		--pkgversion="0.1" \
		--arch="indep" \
		--pkglicense=gpl3 \
		--pkggroup=net \
		--pakdir=../ \
		--maintainer="ex@ex.org" \
		--nodoc \
		--deldoc=yes \
		--deldesc=yes \
		--backup=no

