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

terminal-notifier -title $title -message $time -sound Bottle
