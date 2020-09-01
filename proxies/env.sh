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

    export HTTP_PROXY=${HTTP_PROXY_VALUE}
    export http_proxy=${HTTP_PROXY_VALUE}

    export HTTPS_PROXY=${HTTPS_PROXY_VALUE}
    export https_proxy=${HTTPS_PROXY_VALUE}

    export NO_PROXY=${NO_PROXY_VALUE}
    export no_proxy=${NO_PROXY_VALUE}

    console "Set done"

elif [ "X${ACTION}" == "Xunset" ]; then
    info "Unset proxies..."
    unset HTTP_PROXY HTTPS_PROXY NO_PROXY http_proxy https_proxy no_proxy

    console "Unset done"
else
    error "Invalid parameters!"
    usage
    exit 1
fi
