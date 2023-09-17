#!/bin/bash

# terminal-notifierがインストールされていない場合は↓のコマンドでインストール
# brew install terminal-notifier

FORMAT_DISPLAY="+%H:%M" # 表示用の時刻文字列
FORMAT_CALC="+%Y%m%d%H%M%S" # 比較処理用の時刻文字列

timerMinutes=$1 # $1は第1引数（タイマーの分数を指定）
message='timer'
if [ -n "$2" ]; then
  message='timer : '$2
fi

# miku-skin
echo -ne "\033]6;1;bg;red;brightness;255\a"
echo -ne "\033]6;1;bg;green;brightness;254\a"
echo -ne "\033]6;1;bg;blue;brightness;236\a"

timeDisplayStart=`date -j ${FORMAT_DISPLAY}`
timeDisplayEnd=`date -v+"${timerMinutes}"M -j ${FORMAT_DISPLAY}`
echo "start at $timeDisplayStart"
echo "end   at $timeDisplayEnd"

timeEnd=`date -v+"${timerMinutes}"M -j ${FORMAT_CALC}`
while [ `date -j ${FORMAT_CALC}` -lt "$timeEnd" ]
do
    sleep 1
done

# タイマー終了通知
terminal-notifier -title "${timerMinutes} m" -message "${message}" -sound Submarine

# miku-light-green
echo -ne "\033]6;1;bg;red;brightness;195\a"
echo -ne "\033]6;1;bg;green;brightness;229\a"
echo -ne "\033]6;1;bg;blue;brightness;231\a"

