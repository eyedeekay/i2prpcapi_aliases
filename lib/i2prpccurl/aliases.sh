
authenticate(){
    /usr/bin/curl -s -k --data-binary "{
        \"jsonrpc\":\"2.0\",
        \"id\":\"$1\",
        \"method\":\"Authenticate\",
        \"params\":{
            \"API\": 1,
            \"Password\": \"$2\"}
        }" -H 'content-type:application/json-rpc;' https://127.0.0.1:7650/ 2>&1 |
        tr ',{}' '\n' |
        tr -d '"' | sed 's|result:||g' | tr ':' '=' | sed '/^\s*$/d'
}

token(){
    authenticate "$1" "$2" | grep "Token" | sed 's|Token=|export Token=|g'
}

i2pecho(){
    /usr/bin/curl -s -k --data-binary "{
        \"jsonrpc\":\"2.0\",
        \"id\":\"$1\",
        \"method\":\"Echo\",
        \"params\":{
            \"Token\": \"$Token\",
            \"Echo\": \"$1\"}
        }" -H 'content-type:application/json-rpc;' https://127.0.0.1:7650/ 2>&1 |
        tr ',{}' '\n' |
        tr -d '"' | sed 's|result:||g' | tr ':' '=' | sed '/^\s*$/d'
}

i2pcontrol(){
    /usr/bin/curl -s -k --data-binary "{
        \"jsonrpc\":\"2.0\",
        \"id\":\"$1\",
        \"method\":\"I2PControl\",
        \"params\":{
            \"$1\": \"$2\",
            \"Token\": \"$Token\"}
        }" -H 'content-type:application/json-rpc;' https://127.0.0.1:7650/ 2>&1 |
        tr ',{}' '\n' |
        tr -d '"' | sed 's|result:||g' | tr ':' '=' | sed '/^\s*$/d'
}

password(){
    i2pcontrol "password" "$1"
}

routerinfo(){
    /usr/bin/curl -s -k --data-binary "{
        \"jsonrpc\":\"2.0\",
        \"id\":\"$1\",
        \"method\":\"RouterInfo\",
        \"params\":{
            \"$1\": \"null\",
            \"Token\": \"$Token\"}
        }" -H 'content-type:application/json-rpc;' https://127.0.0.1:7650/ 2>&1 |
        tr ',{}' '\n' |
        tr -d '"' | sed 's|result:||g' | tr ':' '=' | sed '/^\s*$/d'
}

routerstatus(){
    routerinfo "i2p.router.status"
}

routerupstime(){
    routerinfo "i2p.router.uptime"
}

routerversion(){
    routerinfo "i2p.router.version"
}

routernetbwinbound1s(){
    routerinfo "i2p.router.net.bw.inbound.1s"
}

routernetbwinbound15s(){
    routerinfo "i2p.router.net.bw.inbound.15s"
}

routernetbwoutbound1s(){
    routerinfo "i2p.router.net.bw.outbound.1s"
}
routernetbwoutbound15s(){
    routerinfo "i2p.router.net.bw.outbound.15s"
}

routernetstatus(){
    routerinfo "i2p.router.net.status"
}

routernetstatus(){
    routerinfo "i2p.router.net.status"
}

routernetdbactivepeers(){
    routerinfo "i2p.router.netdb.activepeers"
}

routernetdbfastpeers(){
    routerinfo "i2p.router.netdb.fastpeers"
}

routernetdbhighcapacitypeers(){
    routerinfo "i2p.router.netdb.highcapacitypeers"
}

routernetdbisreseeding(){
    routerinfo "i2p.router.netdb.isreseeding"
}

routernetdbknownpeers(){
    routerinfo "i2p.router.netdb.knownpeers"
}

clientservicesinfo(){
    /usr/bin/curl -s -k --data-binary "{
        \"jsonrpc\":\"2.0\",
        \"id\":\"$1\",
        \"method\":\"ClientServicesInfo\",
        \"params\":{
            \"Token\": $Token,
            \"$1\": \"null\"}
        }" -H 'content-type:application/json-rpc;' https://127.0.0.1:7650/ 2>&1 |
        tr ',{}' '\n' |
        tr -d '"' | sed 's|result:||g' | tr ':' '=' | sed '/^\s*$/d'
}

i2ptunnelinfo(){
    /usr/bin/curl -s -k --data-binary "{
        \"jsonrpc\":\"2.0\",
        \"id\":\"I2PTunnel\",
        \"method\":\"ClientServicesInfo\",
        \"params\":{
            \"Token\": $Token,
            \"I2PTunnel\": \"null\"}
        }" -H 'content-type:application/json-rpc;' https://127.0.0.1:7650/ 2>&1 |
        tr ',{}' '\n' |
        tr -d '"' | sed 's|result:||g' | tr ':' '=' | sed '/^\s*$/d'
}
