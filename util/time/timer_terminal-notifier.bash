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

terminal-notifier -title $title -message $time'minutes' -sound Bottle

