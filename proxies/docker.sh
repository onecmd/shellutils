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

    mkdir -p /etc/systemd/system/docker.service.d

    cat > /etc/systemd/system/docker.service.d/http-proxy.conf << EOF
[Service]
Environment="HTTP_PROXY=${HTTP_PROXY_VALUE}" "HTTPS_PROXY=${HTTPS_PROXY_VALUE}" "NO_PROXY=${NO_PROXY_VALUE}"
EOF
    console "Please restart docker service to make it take effect."

elif [ "X${ACTION}" == "Xunset" ]; then
    info "Unset proxies..."
    rm -rf /etc/systemd/system/docker.service.d/http-proxy.conf 
    console "Please restart docker service to make it take effect."
else
    error "Invalid parameters!"
    usage
    exit 1
fi
