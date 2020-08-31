#!/bin/bash


function exportProxiesVariables(){
    proxy=$1
    # if not give proxy in argument then load from configuration:
    if [ "X${proxy}" == "X" ]; then
        info "Set proxy to: "
        log_file ${SCRIPT_ROOT_PATH}/proxies/config/proxies_config.properties

        . ${LOAD_PROPERIES_TO_ENV} ${SCRIPT_ROOT_PATH}/proxies/config/proxies_config.properties
    else
        info "Set proxy to: ${proxy}"
        export HTTP_PROXY_VALUE=${proxy}
        export HTTPS_PROXY_VALUE=${proxy}
    fi
}