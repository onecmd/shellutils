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

    git config --global http.proxy ${HTTP_PROXY_VALUE}
    git config http.sslVerify false

    console "Set done"

elif [ "X${ACTION}" == "Xunset" ]; then
    info "Unset proxies..."

    git config --global --unset http.proxy
    git config --global --unset http.sslVerify

    console "Unset done"
else
    error "Invalid parameters!"
    usage
    exit 1
fi
