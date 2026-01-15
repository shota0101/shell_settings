# tmux
alias tl="tmux ls"

function tn() {
    tab-color 200 240 240
    echo -ne "\e]1;$1\a"
    tmux new -s $1
    tab-color 128 128 128
}

function ta() {
    tab-color 200 240 240
    session=`tmux ls | fzf | awk '{print $1}'`
    echo -ne "\e]1;$session\a"
    tmux a -t $session
    tab-color 128 128 128
}

# C-b d (detach-client) : セッションを抜ける
# C-d : セッションを終了
