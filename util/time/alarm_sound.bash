#!/bin/bash

# time='0959'
time=$1

while [ `date +"%Y%m%d%H%M"` -lt `date +"%Y%m%d"`${time} ]
do
    sleep 60
done

afplay /System/Library/Sounds/Bottle.aiff
