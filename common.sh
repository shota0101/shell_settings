
if [ -d "/mnt/c" ]; then
    echo 'windows ubuntu'
elif [ -d "/home" ]; then
    # ubuntu
    GOOGLE_DRIVE_ROOT='/home/lin/g'
    EMACS_DIRECTORY='/usr'
    alias pbcopy='xsel --clipboard --input'
else
    # mac
    GOOGLE_DRIVE_ROOT='/Volumes/GoogleDrive/My\ Drive'
    EMACS_DIRECTORY=$(brew --prefix emacs)
fi

