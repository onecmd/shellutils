#!/bin/bash


function installOnCentOSByYum(){
    info "installOnCentOSByYum $*"
    service=$1
    if [ "X$service" == "X" ]; then
        error "Argument not right: service_name"
        exit 1
    fi

    yum install -y ${service}
    if [ $? -ne 0 ]; then
        error "Failed install"
        exit 1
    else
        console "Install done"
    fi
}

function uninstallOnCentOSByYum(){
    info "uninstallOnCentOSByYum $*"
    service=$1
    if [ "X$service" == "X" ]; then
        error "Argument not right: service_name"
        exit 1
    fi

    yum remove -y ${service}
    if [ $? -ne 0 ]; then
        error "Failed uninstall"
        exit 1
    else
        console "Uninstall done"
    fi
}

function installOnDebianByApt(){
    info "installOnDebianByApt $*"
    service=$1
    if [ "X$service" == "X" ]; then
        error "Argument not right: service_name"
        exit 1
    fi

    apt-get install -y ${service}
    if [ $? -ne 0 ]; then
        error "Failed install"
        exit 1
    else
        console "Install done"
    fi
}

function uninstallOnDebianByApt(){
    info "uninstallOnDebianByApt $*"
    service=$1
    if [ "X$service" == "X" ]; then
        error "Argument not right: service_name"
        exit 1
    fi

    apt-get remove -y ${service}
    if [ $? -ne 0 ]; then
        error "Failed uninstall"
        exit 1
    else
        console "Uninstall done"
    fi
}

