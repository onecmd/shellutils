#!/bin/bash
SCRIPT_NAME=$0
SCRIPT_PATH=`realpath ${SCRIPT_NAME}`
SCRIPT_ROOT_PATH=$(cd "$(dirname "${SCRIPT_PATH}")";cd ..;pwd)

. ${SCRIPT_ROOT_PATH}/logs/pretty_logs.sh

function usage(){
    echo "$0 install|uninstall"
}

##############################################
## main
## 

ACTION=$1

if [ "X${ACTION}" == "Xinstall" ]; then
    info "Install..."

    curl -sLk https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 -o /usr/bin/jq
    if [ $? -ne 0 ]; then
        error "Failed install"
        exit 1
    else
        chmod +x /usr/bin/jq
        console "Install done"
    fi 

elif [ "X${ACTION}" == "Xuninstall" ]; then
    info "Uninstall..."
    rm -rf /usr/bin/jq

    console "Uninstall done"
else
    error "Invalid parameters!"
    usage
    exit 1
fi
