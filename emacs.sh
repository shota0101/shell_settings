# emacsをGUIで起動
emacsDirectory=$(brew --prefix emacs)
alias egui="/Applications/Emacs.app/Contents/MacOS/Emacs"
# emacsをCUIで起動（設定を読み込まずに）
alias eorg="/Applications/Emacs.app/Contents/MacOS/Emacs -nw --no-init-file"
# emacs daemonの起動
alias edaemon="${emacsDirectory}/bin/emacs --daemon"
# emacsclientの起動
alias e="${emacsDirectory}/bin/emacsclient $@ -nw"
# emacs daemonの終了
alias killedaemon="${emacsDirectory}/bin/emacsclient -e '(kill-emacs)'"

# emacsを読み込み専用で開く
function er() {
    [ -f "$1" ] || (echo "ファイルが見つかりませんでした: $1" >&2; exit 1)
    emacs --no-init-file "$1" --eval '(setq buffer-read-only t)'
}
function erg() {
    [ -f "$1" ] || (echo "ファイルが見つかりませんでした: $1" >&2; exit 1)
    /Applications/Emacs.app/Contents/MacOS/Emacs "$1" --eval '(setq buffer-read-only t)' &
}

# -------------------------------------------------------------------------------
# # linux環境
# # emacsをCUIで起動（設定を読み込まずに）
# alias i="emacs -nw --no-init-file"
# # emacs daemonの起動
# alias edaemon="emacs --daemon"
# # emacsclientの起動
# alias c="emacsclient $@ -nw"
# # emacs daemonの終了
# alias killedaemon="emacsclient -e '(kill-emacs)'"
