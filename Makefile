
install:
	mkdir -p /usr/lib/i2prpccurl/
	install -m755 lib/i2prpccurl/alias.sh /usr/lib/i2prpccurl/alias.sh
	install -m755 bin/auth.sh /usr/lib/i2prpccurl/auth.sh
	install -m755 bin/routerinfodump.sh /usr/lib/i2prpccurl/routerinfodump.sh
	install -m755 bin/tunneldump.sh /usr/lib/i2prpccurl/tunneldump.sh
	mkdir -p /etc/i2prpc
	install -m755 etc/i2prpc/i2prpc.conf /etc/i2prpc
	#install -m755 bin/ /usr/lib/i2prpccurl/

remove:
	rm -rf /usr/lib/i2prpccurl/*.sh /etc/i2prpc/i2prpc.conf
