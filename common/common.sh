#!/bin/bash

export LOAD_PROPERIES_TO_ENV=${SCRIPT_ROOT_PATH}/libs/load_properties_to_env.sh

function getLinuxOSReleaseID(){
    if [ -f /etc/os-release ]; then
        id=$(cat /etc/os-release | grep ^ID= | awk -F '=' '{print $2}' | sed 's/"//g')
        echo $id
    else
        echo "unknown"
    fi
}

function getLinuxOSVersionID(){
    if [ -f /etc/os-release ]; then
        id=$(cat /etc/os-release | grep ^VERSION_ID= | awk -F '=' '{print $2}' | sed 's/"//g')
        echo $id
    else
        echo "unknown"
    fi
}

function getLinuxOSBitID(){
    os_bit=$(uname -m)

    if [ "X${os_bit}" == "Xx86_64" ]; then
        echo "64"
    elif [ "X${os_bit}" == "Xi686" ]; then
        echo "32"
    else
        echo "32"
    fi
}

function exportLinuxOSVariables(){
    export OS_RELEASE_ID=$(getLinuxOSReleaseID)
    export OS_VERSION_ID=$(getLinuxOSVersionID)
    export OS_BIT_ID=$(getLinuxOSBitID)
}
