#! /usr/bin/env sh

set -e

if [ -f "/etc/i2prpc/i2prpc.conf" ]; then
    . "/etc/i2prpc/i2prpc.conf"
fi
if [ -f "i2prpc.conf" ]; then
    . "i2prpc.conf"
else
    LIB_i2pcontrolcurl="./lib/i2prpccurl/aliases.sh"
fi

. "$LIB_i2pcontrolcurl"

if [ -f ./bin/auth.sh ]; then
    $(./bin/auth.sh $1)
elif [ -f ./auth.sh ]; then
    $(./auth.sh $1)
else
    $(/usr/bin/i2prpcauth $1)
fi



routerstatus | grep -v jsonrpc=2.0
routerupstime | grep -v jsonrpc=2.0
routerversion | grep -v jsonrpc=2.0
routernetbwinbound1s | grep -v jsonrpc=2.0
routernetbwinbound15s | grep -v jsonrpc=2.0
routernetbwoutbound1s | grep -v jsonrpc=2.0
routernetbwoutbound15s | grep -v jsonrpc=2.0
routernetstatus | grep -v jsonrpc=2.0
routernetstatus | grep -v jsonrpc=2.0
routernetdbactivepeers | grep -v jsonrpc=2.0
routernetdbfastpeers | grep -v jsonrpc=2.0
routernetdbhighcapacitypeers | grep -v jsonrpc=2.0
routernetdbisreseeding | grep -v jsonrpc=2.0
routernetdbknownpeers | grep -v jsonrpc=2.0
