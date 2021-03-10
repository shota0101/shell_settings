#!/bin/bash

# \nを書かずに\rで行頭に戻る
# 次の出力にうつるときは、\nを出力

sec=$1*60
declare -i i=0
while [[ $i -lt $sec ]]
do
    # echo -ne ${i}' / '$sec'\r'
    sleep 1
    i=$((i+1))
done

afplay /System/Library/Sounds/Bottle.aiff

