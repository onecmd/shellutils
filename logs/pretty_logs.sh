#!/bin/bash
# Import this lab file as: . ${SCRIPT_ROOT_PATH}/logs/pretty_logs.sh
#   Define SCRIPT_NAME=$0 in top of each file

LOG_FILE=/var/log/shellutils.log

function getTimeStr(){
    str=`date '+%Y-%m-%d %H:%M:%S'`
    echo $str
}

function console(){
    echo "$1"
}

function log(){
    info "$1"
}

function info(){
    if [ "X${DEBUG_ENABLED}" == "XTRUE" ]; then
        echo "$(getTimeStr) | ${SCRIPT_NAME} | INFO | $1"
    fi
    echo "$(getTimeStr) | ${SCRIPT_NAME} | INFO | $1" >> ${LOG_FILE}
}

function warn(){
    if [ "X${DEBUG_ENABLED}" == "XTRUE" ]; then
        echo "$(getTimeStr) | ${SCRIPT_NAME} | WARN | $1"
    fi
    echo "$(getTimeStr) | ${SCRIPT_NAME} | WARN | $1" >> ${LOG_FILE}
}

function error(){
    console "$1"
    echo "$(getTimeStr) | ${SCRIPT_NAME} | ERROR | $1" >> ${LOG_FILE}
    console "Detail logs please check: ${LOG_FILE}"
}

function failedExit(){
    console ""
    console ""
    if [ "X${DEBUG_ENABLED}" == "XTRUE" ]; then
        console "Command execute failed, check above logs"
    else        
        console "Command execute failed, detail logs:"
        console "#############################################################################"
        console "# cat ${LOG_FILE}"
        cat ${LOG_FILE}
    fi
    console ""
    exit 1
}

function log_file(){
    if [ -f "$1" ]; then
        info "cat $1"
        cat "$1" >> ${LOG_FILE}
        if [ "X${DEBUG_ENABLED}" == "XTRUE" ]; then
            cat "$1"
        fi
    else
        error "File $1 not exist!"
    fi
}

function get_costed_time(){
    local start_time=$1
    local cur_time=`date +%s`
    local cost_time=$((cur_time-start_time))

    info "Cost time: ${cur_time} - ${start_time} = ${cost_time}"

    echo ${cost_time}
}
