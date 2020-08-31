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

    cat > /etc/profile.d/shellutils_proxy.sh << EOF
export https_proxy=${HTTPS_PROXY_VALUE}
export http_proxy=${HTTP_PROXY_VALUE}
export no_proxy=${NO_PROXY_VALUE}

export HTTPS_PROXY=${https_proxy}
export HTTP_PROXY=${http_proxy}
export NO_PROXY=${no_proxy}
EOF

elif [ "X${ACTION}" == "Xunset" ]; then
    info "Unset proxies..."
    rm -rf /etc/profile.d/shellutils_proxy.sh
else
    error "Invalid parameters!"
    usage
    exit 1
fi
