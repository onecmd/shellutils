#!/bin/bash
# Parse json key pair config to env parameters
# eg. 
#   {
#       "parameter_1":"value_1",
#       "parameter_2":"value_2"
#   }
# To:
#   export parameter_1=value_1
#   export parameter_2=value_2
# 

json_file=$1

if [ ! -f ${json_file} ]; then
    echo "${json_file} not a file!"
    exit 1
fi

for cmd_line in $(cat ${json_file} | jq -r "to_entries|map(\"\(.key)=\(.value|tostring)\")|.[]" )
do
    compiled_cmd=$(echo ${cmd_line} | sed -e "s#\${WORKSPACE}#${WORKSPACE}#g" | sed -e "s#\${SCRIPT_ROOT}#${SCRIPT_ROOT_PATH}#g")
    export ${compiled_cmd}
done
