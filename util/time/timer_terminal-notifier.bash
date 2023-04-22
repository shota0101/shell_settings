#!/bin/bash

# terminal-notifierがインストールされていない場合は↓のコマンドでインストール
# brew install terminal-notifier

formatDisplay="+%H:%M" # 表示用の時刻文字列
formatCalc="+%d%H%M%S" # 比較処理用の時刻文字列

timerMinutes=$1 # $1は第1引数（タイマーの分数を指定）
message='timer'
if [ -n "$2" ]; then
  message='timer : '$2
fi

# miku-pink
echo -ne "\033]6;1;bg;red;brightness;225\a"
echo -ne "\033]6;1;bg;green;brightness;40\a"
echo -ne "\033]6;1;bg;blue;brightness;133\a"

timeDisplayStart=`date -j ${formatDisplay}`
timeDisplayEnd=`date -v+"${timerMinutes}"M -j ${formatDisplay}`
echo "start at $timeDisplayStart"
echo "end   at $timeDisplayEnd"

timeEnd=`date -v+"${timerMinutes}"M -j ${formatCalc}`
while [ `date -j ${formatCalc}` -lt "$timeEnd" ]
do
    sleep 1
done

# タイマー終了通知
terminal-notifier -title "${timerMinutes} m" -message "${message}" -sound Bottle

# miku-gray
echo -ne "\033]6;1;bg;red;brightness;190\a"
echo -ne "\033]6;1;bg;green;brightness;200\a"
echo -ne "\033]6;1;bg;blue;brightness;209\a"

