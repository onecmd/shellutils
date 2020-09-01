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

    sed -i '/proxy=.*/d' /etc/yum.conf
    echo "proxy=${HTTP_PROXY_VALUE}" >> /etc/yum.conf

    console "Set done"

elif [ "X${ACTION}" == "Xunset" ]; then
    info "Unset proxies..."
    sed -i '/proxy=.*/d' /etc/yum.conf

    console "Unset done"
else
    error "Invalid parameters!"
    usage
    exit 1
fi
