if command -v termux-clipboard-set >/dev/null 2>&1; then
    # termux
    alias pbcopy='termux-clipboard-set'
    EMACS_DIRECTORY='/usr'
elif [ -d "/Volumes" ]; then
    # mac
    GOOGLE_DRIVE_ROOT='/Users/shota/Library/CloudStorage/GoogleDrive-hayashi0101@epg.jp/My Drive'
    EMACS_DIRECTORY=$(brew --prefix emacs)
elif [ -d "/mnt/c" ]; then
    # windows wsl
    export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
    GOOGLE_DRIVE_ROOT='/mnt/g/マイドライブ'
    EMACS_DIRECTORY='/usr'
    alias pbcopy='clip.exe'
else
    # ubuntu
    export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
    GOOGLE_DRIVE_ROOT='/home/lin/g'
    EMACS_DIRECTORY='/usr'
    alias pbcopy='xsel --clipboard --input'
fi

alias c='pbcopy'

