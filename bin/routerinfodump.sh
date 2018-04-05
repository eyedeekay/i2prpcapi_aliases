#! /usr/bin/env sh

set -e

. ./lib/i2prpccurl/aliases.sh

$(./bin/auth.sh $1)

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
