
if [ -d "/Volumes" ]; then
    # mac
    GOOGLE_DRIVE_ROOT='/Volumes/GoogleDrive/My Drive'
    EMACS_DIRECTORY=$(brew --prefix emacs)
elif [ -d "/mnt/c" ]; then
    echo 'windows ubuntu'
else
    # ubuntu
    GOOGLE_DRIVE_ROOT='/home/lin/g'
    EMACS_DIRECTORY='/usr'
    alias pbcopy='xsel --clipboard --input'
fi

