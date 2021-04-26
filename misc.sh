# export PS1="%T %~ $ "
PROMPT='%S%1~%s%(!.#.%%) '

alias upsh="source ~/.zshrc" # シェルの設定を再読込
alias up="cd .. ; pwd"
alias p="pbcopy"
alias cpd="pwd | pbcopy"
alias cdate="date +%Y-%m-%d_%H-%M-%S | pbcopy"
alias d="date '+%m-%d_' | pbcopy"
alias dy="date '+%Y-%m-%d_' | pbcopy"
function mcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
function cdp () { cd "$@" && eval pwd "\"\$$#\""; }
function c () { cd `ls | peco` && pwd; }
function cdl () { cd "$@" && ls -la; }

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

alias d='tab-color 0 139 139' # darkcyan
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

# iTermのタブ名を変更
function a () {
    echo -ne "\e]1;dummy\a" # iTermのアップデートで何故か一度目だと正常に動かないため
    echo -ne "\e]1;$@\a"
}

# iTermのタブ名をカレントディレクトリに変更
function ad () {
    echo -ne "\e]1;dummy\a" # iTermのアップデートで何故か一度目だと正常に動かないため
    echo -ne "\e]1;`basename $(pwd)`\a"
}

# 分単位でsleepする
function mov () {
    echo ${1}
    cp "${1}" ~/private/git/movie-controller/movies/current/movie1.mov
    open -a /Applications/Google\ Chrome.app file:///Users/lin/private/git/movie-controller/page-mov1.html
}

# 分単位でsleepする
function minutes () {
    seconds=`expr $1 \* 3600`
    sleep $seconds
}

function myfind() {
    file_name=`ls -1R | grep -vE ":$" | peco`
    current_directory=`pwd`
    file_path=`find $current_directory -name $file_name`
    echo $file_path
    echo $file_path | pbcopy
}

function mygrep() {
    grep -r $1 .
}

function mydiff() {
    /Applications/Emacs.app/Contents/MacOS/Emacs -nw --no-init-file ~/diff/a.txt
    /Applications/Emacs.app/Contents/MacOS/Emacs -nw --no-init-file ~/diff/b.txt
    opendiff ~/diff/a.txt ~/diff/b.txt
}

alias m1="bash ~/private/git/movie-controller/next1.bash"
alias m2="bash ~/private/git/movie-controller/next2.bash"
alias m3="bash ~/private/git/movie-controller/next3.bash"
alias a1="bash ~/private/git/movie-controller/audio1.bash"
alias a2="bash ~/private/git/movie-controller/audio2.bash"

# grep -r "keyword" directory
alias gr="grep -ri" # -i → 検索条件に大文字と小文字の区別をなくす
alias grab="grep -A 3 -B 3 -ri" # -A 3 -B 3 → 前後3行を表示
alias grh="grep -rih" # -h → 検索結果の先頭にマッチしたファイル名を表示しない

alias f="find . -name"

alias chrome="open -a /Applications/Google\ Chrome.app"
alias ij='open -b com.jetbrains.intellij'
alias st='open -b com.torusknot.SourceTreeNotMAS'

alias alarm_alerter="bash ~/private/git/shell_settings/util/time/alarm_alerter.bash"
alias alarm_sound="bash ~/private/git/shell_settings/util/time/alarm_sound.bash"
alias alarm_terminal-notifier="bash ~/private/git/shell_settings/util/time/alarm_terminal-notifier.bash"
alias timer_alerter="bash ~/private/git/shell_settings/util/time/timer_alerter.bash"
alias timer_sound="bash ~/private/git/shell_settings/util/time/timer_sound.bash"
alias timer_terminal-notifier="bash ~/private/git/shell_settings/util/time/timer_terminal-notifier.bash"

alias tp="cat ~/private/git/box/memo/terminal-private.sh | peco | pbcopy"
alias t="cat ~/private/git/company/memo/terminal.sh | peco | pbcopy"

alias sv="bash ~/private/git/box/program/shell_script/mac-air/search-videos.sh"

alias kb='date ; node ~/private/git/punch/dist/command/punchBreaktime.js'
alias ko='date ; node ~/private/git/punch/dist/command/punchOvertime.js'
alias kp='node ~/private/git/punch/dist/command/printTime.js'

