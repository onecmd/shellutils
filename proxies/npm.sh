#!/bin/bash
SCRIPT_NAME=$0
SCRIPT_PATH=`realpath ${SCRIPT_NAME}`
SCRIPT_ROOT_PATH=$(cd "$(dirname "${SCRIPT_PATH}")";cd ..;pwd)

. ${SCRIPT_ROOT_PATH}/logs/pretty_logs.sh
. ${SCRIPT_ROOT_PATH}/proxies/common.sh

function usage(){
    echo "$0 set|unset [proxy]"
}

##############################################
## main
## 

ACTION=$1

if [ "X${ACTION}" == "Xset" ]; then
    info "Set proxy..."

    proxy=$2
    exportProxiesVariables ${proxy}

    npm config set proxy=${HTTP_PROXY_VALUE}
    npm config set https-proxy=${HTTPS_PROXY_VALUE}

    console "Set done"

elif [ "X${ACTION}" == "Xunset" ]; then
    info "Unset proxies..."

    npm config delete proxy
    npm config delete https-proxy

    console "Unset done"
else
    error "Invalid parameters!"
    usage
    exit 1
fi
