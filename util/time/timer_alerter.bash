#!/bin/bash

if [ $# -lt 2 ]; then
    title='Timer'
else
    title=$2
fi

sec=$1*60
declare -i i=0
while [[ $i -lt $sec ]]
do
    # echo -ne ${i}' / '$sec'\r'
    sleep 1
    i=$((i+1))
done

echo $title > ~/temp-alerter.txt
open -a TextEdit ~/temp-alerter.txt
# alerter -title $title \
# 	-subtitle $time'minutes' \
# 	-message "confirm your notification" \
# 	-appIcon "http://flat-icon-design.com/f/f_object_36/s64_f_object_36_0nbg.png" \
# 	-closeLabel "close" \
# 	-json

