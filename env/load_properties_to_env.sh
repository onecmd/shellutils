#!/bin/bash
# Parse properties config to export env parameters
# eg. 
#    parameter_1=value_1
#    parameter_2=value_2
# To:
#   export parameter_1=value_1
#   export parameter_2=value_2
# 

file=$1

if [ ! -f ${file} ]; then
    echo "${file} not a file!"
    exit 1
fi

for cmd_line in $(cat ${file} | grep -Ev '^$|[#;]' | sed -e 's/[ ]*=[ ]*/=/g')
do
    compiled_cmd=$(echo ${cmd_line} | sed -e "s#\${WORKSPACE}#${WORKSPACE}#g" | sed -e "s#\${SCRIPT_ROOT}#${SCRIPT_ROOT_PATH}#g")
    export ${compiled_cmd}
done
