#!/bin/bash

# miku-skin
echo -ne "\033]6;1;bg;red;brightness;255\a"
echo -ne "\033]6;1;bg;green;brightness;254\a"
echo -ne "\033]6;1;bg;blue;brightness;236\a"

function currentTime() {
    date +"%Y%m%d%H%M"
}

time=$1
message='alarm'
if [ -n "$2" ]; then
    message='alarm : '$2
fi

endTime=`date +"%Y%m%d"`${time}
if [ `currentTime` -gt $endTime ]; then
    # 日付を跨ぐことを考慮
    endTime=`date -v+1d +"%Y%m%d"`${time}
fi

while [ `currentTime` -lt $endTime ]
do
    sleep 1
done

terminal-notifier -title `date +"%H:%M"` -message "${message}" -sound Bottle

# miku-gray
echo -ne "\033]6;1;bg;red;brightness;190\a"
echo -ne "\033]6;1;bg;green;brightness;200\a"
echo -ne "\033]6;1;bg;blue;brightness;209\a"

