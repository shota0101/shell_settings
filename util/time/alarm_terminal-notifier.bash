#!/bin/bash

time=$1
if [ $# -lt 2 ]; then
    title='alarm'
else
    title=$2
fi

# miku-skin
echo -ne "\033]6;1;bg;red;brightness;255\a"
echo -ne "\033]6;1;bg;green;brightness;254\a"
echo -ne "\033]6;1;bg;blue;brightness;236\a"

while [ `date +"%Y%m%d%H%M"` -lt `date +"%Y%m%d"`${time} ]
do
    sleep 10
done

terminal-notifier -title $title -message $time -sound Bottle
