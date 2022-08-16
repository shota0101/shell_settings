# export PS1="%T %~ $ "
PROMPT='%S%1~%s%(!.#.%%) '

alias upsh="source ~/.zshrc" # シェルの設定を再読込
alias up="cd .. ; pwd"
alias o="open"
alias d="open ."
alias p="pbcopy"
alias cpd="pwd | pbcopy"
alias gre="find ./ -type f | xargs grepx"
alias f="find . -name"
alias cdate="date +%Y-%m-%d_%H-%M-%S | pbcopy"
alias ctime="date '+%m-%d_' | pbcopy"
alias cday="date '+%Y-%m-%d_' | pbcopy"
function mcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
function cdp () { cd "$@" && eval pwd "\"\$$#\""; }
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
function minutes () {
    seconds=`expr $1 \* 3600`
    sleep $seconds
}

function mydiff() {
    /Applications/Emacs.app/Contents/MacOS/Emacs -nw --no-init-file ~/diff/a.txt
    /Applications/Emacs.app/Contents/MacOS/Emacs -nw --no-init-file ~/diff/b.txt
    opendiff ~/diff/a.txt ~/diff/b.txt
}

alias m1="bash ~/private/git/movie-controller/next1.bash"
alias m2="bash ~/private/git/movie-controller/next2.bash"
alias m3="bash ~/private/git/movie-controller/next3.bash"

alias chrome="open -a /Applications/Google\ Chrome.app"
alias ij='open -b com.jetbrains.intellij'

alias alarm_alerter="bash ~/private/git/shell_settings/util/time/alarm_alerter.bash"
alias alarm_sound="bash ~/private/git/shell_settings/util/time/alarm_sound.bash"
alias alarm_terminal-notifier="bash ~/private/git/shell_settings/util/time/alarm_terminal-notifier.bash"
alias timer_alerter="bash ~/private/git/shell_settings/util/time/timer_alerter.bash"
alias timer_sound="bash ~/private/git/shell_settings/util/time/timer_sound.bash"
alias timer="bash ~/private/git/shell_settings/util/time/timer_terminal-notifier.bash"

alias t="cat ~/private/git/company/memo/terminal.sh | peco | pbcopy"
alias tt="cat ~/private/git/box/memo/terminal-private.sh | peco | pbcopy"
function cr() {
    directory=`cat ~/private/git/company/memo/path.txt | peco`
    cd "${HOME}/${directory}"
    ad
    brown
}
function ca() {
    directory=`cat ~/private/git/box/memo/path-private.txt | peco`
    cd "${directory}"
    ad
    brown
}
function fr() {
    directory=`cat ~/private/git/company/memo/path.txt | peco`
    cd "${HOME}/${directory}"
    ad
    open "${HOME}/${directory}"
}
function fa() {
    directory=`cat ~/private/git/box/memo/path-private.txt | peco`
    cd "${directory}"
    ad
    open "${directory}"
}

alias sv="bash ~/private/git/box/program/shell_script/mac-air/search-videos.sh"

alias kb='date ; node ~/private/git/punch/dist/command/punchBreaktime.js'
alias ko='date ; node ~/private/git/punch/dist/command/punchOvertime.js'
alias kp='node ~/private/git/punch/dist/command/printTime.js'

