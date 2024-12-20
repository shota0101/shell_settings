. ~/Documents/git/shell_settings/common.sh

# export PS1="%T %~ $ "
PROMPT='%S%1~%s%(!.#.%%) '

HISTSIZE=365000
# SAVEHIST

# [pecoを使って端末操作を爆速にする - Qiita](https://qiita.com/reireias/items/fd96d67ccf1fdffb24ed)
# 履歴をpecoで絞る
function peco-history-selection() {
    BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

alias upsh="source ~/.zshrc" # シェルの設定を再読込
alias u="cd .. ; pwd"
alias le='ls -a | less -S' # -Sで折り返さない
alias i="open ." # 予約語と干渉するのでfiは使えない
alias p="peco | tr -d '\n' | pbcopy"
alias cpd="pwd | tr -d '\n' | pbcopy"
alias cdate="date +%Y-%m-%d_%H-%M-%S | tr -d '\n' | pbcopy"
alias ctime="date '+%m-%d_' | tr -d '\n' | pbcopy"
alias cday="date '+%Y-%m-%d_' | tr -d '\n' | pbcopy"
alias ds="find . -name '.DS_Store' -type f -ls -delete"
alias n="terminal-notifier -title 'title' -message 'message' -sound Bottle"
function mcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
# lsの結果をクリップボードにコピー
alias lc="ls -a | peco | tr -d '\n' | pbcopy"

# カレントディレクトリ直下のディレクトリをインクリメンタルサーチして移動
function l () {
    while true; do
	file=`ls | sort | peco`
	if [ -z "$file" ]; then
	    echo 'abort'
	    break
	elif [ -f "$file" ]; then
	    open "$file"
	    break
	elif [ -d "$file" ]; then
	    cd "$file"
	fi
    done
}

# カレントディレクトリ配下のディレクトリをインクリメンタルサーチして移動
# 第一引数：探索するディレクトリの深さを指定（省略時は全て探索）
function f () {
    if [ -n "$1" ]; then
	directory=`find . -type d -not -path "*/.git/*"  -not -path "*/.git" -maxdepth $1 | sort | peco`
    else
	directory=`find . -type d -not -path "*/.git/*"  -not -path "*/.git" | sort | peco`
    fi

    cd "$directory"
    ls -la
    pwd
}

function kt () {
    # 参考
    # brew install kotlin
    kotlinc $@ -include-runtime -d temp.jar
    java -jar temp.jar
    rm temp.jar
}

# タブの色を変更
function tab-color() {
    echo -ne "\033]6;1;bg;red;brightness;$1\a"
    echo -ne "\033]6;1;bg;green;brightness;$2\a"
    echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}
function tab-reset() {
    echo -ne "\033]6;1;bg;*;default\a"
}

alias red='tab-color 204 51 51'
alias green='tab-color 51 204 102'
alias blue='tab-color 0 204 255'
alias yellow='tab-color 255 255 100'
alias black='tab-color 0 0 0'
alias gray='tab-color 128 128 128'
alias white='tab-color 255 250 250'
alias orange='tab-color 255 69 0'

alias brown='tab-color 165 42 42'
alias pink='tab-color 255 20 147'
alias steelblue='tab-color 70 130 180'
alias purple='tab-color 120 120 180'

# miku color
# http://smallwebmemo.blog113.fc2.com/blog-entry-311.html
alias miku-black='tab-color 55 59 62'
alias miku-gray='tab-color 190 200 209'
alias miku-skin='tab-color 255 254 236'
alias miku-light-green='tab-color 195 229 231'
alias miku-green='tab-color 134 206 203'
alias miku-dark-green='tab-color 19 122 127'
alias miku-pink='tab-color 225 40 133'

# iTermのタブ名を変更
function a () {
    echo -ne "\e]1;dummy\a" # iTermのアップデートで何故か一度目だと正常に動かないため
    echo -ne "\e]1;$@\a"
}

# iTermのタブ名をカレントディレクトリに変更
function ad () {
    echo -ne "\e]1;dummy\a" # iTermのアップデートで何故か一度目だと正常に動かないため
    echo -ne "\e]1;`basename "$(pwd)"`\a"
    miku-pink
}

# 分単位でsleepする
function minutes () {
    seconds=`expr $1 \* 3600`
    sleep $seconds
}

function mydiff() {
    /Applications/Emacs.app/Contents/MacOS/Emacs -nw --no-init-file ~/diff/a.txt
    /Applications/Emacs.app/Contents/MacOS/Emacs -nw --no-init-file ~/diff/b.txt
    opendiff ~/diff/a.txt ~/diff/b.txt
}

alias chrome="open -a /Applications/Google\ Chrome.app"
alias ij='open -b com.jetbrains.intellij'

alias al="bash ~/Documents/git/shell_settings/util/time/alarm_terminal-notifier.bash"
alias ti="bash ~/Documents/git/shell_settings/util/time/timer_terminal-notifier.bash"

alias t="cat ~/Documents/git/company/memo/terminal.sh | peco | tr -d '\n' | pbcopy"
alias tt="cat ~/Documents/git/box/memo/terminal-private.sh | peco | tr -d '\n' | pbcopy"

function ca() {
    directory=`cat ~/Documents/git/box/memo/path.txt | peco`
    directory=${directory/\~/$HOME} # チルダをホームディレクトリに置換
    directory=${directory/GOOGLE_DRIVE/$GOOGLE_DRIVE_ROOT}
    cd "${directory}"
    ad
    miku-dark-green
}

function cc() {
    directory=`cat ~/Documents/git/box/memo/path.txt | peco | tr -d '\n'`
    directory=${directory/\~/$HOME} # チルダをホームディレクトリに置換
    directory=${directory/GOOGLE_DRIVE/$GOOGLE_DRIVE_ROOT}
    echo -n "$directory" | pbcopy
}

alias sv="bash ~/Documents/git/box/program/shell_script/mac-air/search-videos.sh"

alias kb='date ; node ~/Documents/git/punch/dist/command/punchBreaktime.js'
alias ko='date ; node ~/Documents/git/punch/dist/command/punchOvertime.js'
alias kp='node ~/Documents/git/punch/dist/command/printTime.js'

