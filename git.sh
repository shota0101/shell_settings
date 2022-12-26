# Git

alias g="git"
alias l="lazygit"
alias ts="tig status"

# -------------------------------------------------------------------------------

alias ga="git add "

alias gap="git add -p"

function gan() {
    git add `git status | peco | awk '{print $1}'`
}

function gam() {
    git add `git status | peco | awk '{print $2}'`
}

# -------------------------------------------------------------------------------

alias gb="git branch "
# alias gb="git branch > ~/temp/temp.txt ; $(brew --prefix emacs)/bin/emacsclient -nw ~/temp/temp.txt"
alias gbc="git branch | peco | pbcopy"

function gbd() {
    git branch -D `git branch --merged | peco`
}

function gbda() {
    git branch -D `git branch | peco`
}

# -------------------------------------------------------------------------------

alias gcp="git cherry-pick"
alias gcm="git commit -m"
alias gcmdate='git commit -m "$(date)"'
alias gca="git commit --amend"
alias gchb="git checkout -b"
alias gch="git checkout"
function gcb() {
    # gitのブランチを表示して、インクリメンタルサーチでブランチを絞って切り替えるワンライナー
    git checkout `git branch | peco`
}

# -------------------------------------------------------------------------------

alias gd="git diff"
function gdp() {
    git diff origin/master --name-only | awk '{print "* " $1 }'
}
function gdf() {
    git diff origin/master --name-only | awk -F '/' '{print "* " $NF }'
}

# -------------------------------------------------------------------------------

function gl() {
    git log | peco | awk '{print $2}' | pbcopy
}

function glc() {
    git log | peco | pbcopy
}

# -------------------------------------------------------------------------------

alias gpp="git pull --prune"
alias gp="git push"
alias gpu="git push |& awk 'NR==4' | pbcopy"

# -------------------------------------------------------------------------------

alias grb="git rebase"
alias grbd="git rebase  --committer-date-is-author-date"
function grbh() {
    git rebase -i HEAD~$1
}

alias gr="git reset HEAD"
alias grs="git reset --soft"
function grn() {
    git reset HEAD `git status | peco | awk '{print $3}'`
}
function grm() {
    git reset HEAD `git status | peco | awk '{print $2}'`
}

# -------------------------------------------------------------------------------

alias grv="git revert"
alias gs="git status"
alias gsc="git status | peco | pbcopy"
alias gsh="git stash"
alias gsp="git stash pop"

# -------------------------------------------------------------------------------

function gweb() {
    echo `git remote -v | awk 'NR==1' | awk '{print $2}'` | pbcopy
}

# -------------------------------------------------------------------------------

function gj() {
    cd ~/Documents/git/
    cd `ls | peco`
    echo -ne "\e]1;`basename $(pwd)`\a" # タブ名を変更カレントディレクトリに変更
    purple
    # open -b com.jetbrains.intellij . # intellijでプロジェクトを開く ( 既に開いてたらアクティブウィンドウを切り替え )
    pwd
}

function gpull() {
    isModified=`git status | grep 'modified:' | wc -c`
    
    if [ $isModified -ne 0 ]
    then
	echo 'modifiedファイルが存在するのでstash'
	git stash
    fi
    
    git pull
    
    if [ $isModified -ne 0 ]
    then
	isConflict=`git stash pop | grep 'CONFLICT' | wc -c`
	if [ $isConflict -ne 0 ]
	then
            echo 'コンフリクトしちゃいました'
            exit 1
	fi
    fi
}

