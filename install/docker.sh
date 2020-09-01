#!/bin/bash
SCRIPT_NAME=$0
SCRIPT_PATH=`realpath ${SCRIPT_NAME}`
SCRIPT_ROOT_PATH=$(cd "$(dirname "${SCRIPT_PATH}")";cd ..;pwd)

. ${SCRIPT_ROOT_PATH}/logs/pretty_logs.sh
. ${SCRIPT_ROOT_PATH}/common/common.sh
. ${SCRIPT_ROOT_PATH}/install/common.sh

function usage(){
    echo "$0 install|uninstall"
}


##############################################
## main
## 

ACTION=$1

exportLinuxOSVariables

if [ "X${ACTION}" == "Xinstall" ]; then
    info "Install..."

    if [ "X${OS_RELEASE_ID}" == "Xcentos" ]; then
        installOnCentOSByYum docker
    elif [ "X${OS_RELEASE_ID}" == "Xdebian" ]; then
        installOnDebianByApt docker
    else
        console "Unknown OS release."
    fi

elif [ "X${ACTION}" == "Xuninstall" ]; then
    info "Uninstall..."

    if [ "X${OS_RELEASE_ID}" == "Xcentos" ]; then
        uninstallOnCentOSByYum docker
    elif [ "X${OS_RELEASE_ID}" == "Xdebian" ]; then
        uninstallOnDebianByApt docker
    else
        console "Unknown OS release."
    fi
else
    error "Invalid parameters!"
    usage
    exit 1
fi
