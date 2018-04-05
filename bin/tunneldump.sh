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



tunnelinfo
