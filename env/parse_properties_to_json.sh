#!/bin/bash
# Parse properties config to export env parameters
# eg. 
#    parameter_1=value_1
#    parameter_2=value_2
# or:
#   export parameter_1=value_1
#   export parameter_2=value_2
# to
#   {
#       "parameter_1":"value_1",
#       "parameter_2":"value_2"
#   }

src=$1
dst=$2

if [ ! -f ${src} ]; then
    echo "${src} not a file!"
    exit 1
fi

str=$(cat $src | grep -Ev '^$|[#;]' | awk -F '=' '{print "\""$1"\":\""$2"\","}')
echo "{$str}" >>  $dst

# replace no needed chart:
sed -i 's/export[ ][ ]*//g' $dst
sed -i 's/"[ ][ ]*/"/g' $dst
sed -i 's/[ ][ ]*"/"/g' $dst
sed -i 's/"":""//g' $dst
sed -i 's/,}/}/g' $dst

# format json:
cat $dst | jq . > $dst
