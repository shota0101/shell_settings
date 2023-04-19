#!/bin/bash

# terminal-notifierがインストールされていない場合は↓のコマンドでインストール
# brew install terminal-notifier

timer_minutes=$1 # $1は第1引数（タイマーの分数を指定）
title='timer'
if [ -n "$2" ]; then
  title=$2
fi

# miku-pink
echo -ne "\033]6;1;bg;red;brightness;225\a"
echo -ne "\033]6;1;bg;green;brightness;40\a"
echo -ne "\033]6;1;bg;blue;brightness;133\a"

# 1分ごとcurrent_minutesをインクリメントさせtimer_minutesを超えるのを待つ
declare -i current_minutes=0
while [[ $current_minutes -lt $timer_minutes ]] # current_minutesがtimer_minutesに達するまでループ
do
    sleep 60 # 60秒(=1分待つ)
    current_minutes=$((current_minutes+1))
    
    message="$current_minutes minutes have passed ( $(($timer_minutes-$current_minutes)) minutes left )"
    echo $message
done

# タイマー終了通知
message="$current_minutes minutes have passed"
terminal-notifier -title "${title}" -message "${message}" -sound Bottle
# sleep 60 # 最初の通知で反応しない場合は、60秒→30秒→10秒後に再度通知。終わらせるにはCtrl-Cで強制終了
# terminal-notifier -title "${title}" -message "${message}" -sound Bottle
# sleep 30

# while true
# do
#     terminal-notifier -title "${title}" -message "${message}" -sound Bottle
#     sleep 10
# done

# 通知音のカスタマイズしたい場合は↓参照
# https://qiita.com/tbpgr/items/256c83adc8a88502ce3b

