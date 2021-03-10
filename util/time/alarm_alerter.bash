#!/bin/bash

if [ $# -lt 2 ]; then
    title='Timer'
else
    title=$2
fi

# time='0959'
time=$1

while [ `date +"%Y%m%d%H%M"` -lt `date +"%Y%m%d"`${time} ]
do
    sleep 60
done

echo $title > ~/temp-alerter.txt
open -a TextEdit ~/temp-alerter.txt
# alerter -title $title \
# 	-subtitle $time'minutes' \
# 	-message "confirm your notification" \
# 	-appIcon "http://flat-icon-design.com/f/f_object_36/s64_f_object_36_0nbg.png" \
# 	-closeLabel "close" \
# 	-json

