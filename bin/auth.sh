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

if [ -z "$i2pcontrol_password" ]; then
    if [ ! -z "$1" ]; then
        i2pcontrol_password="$1"
    fi
fi

token test "$i2pcontrol_password"
