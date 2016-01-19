[ -f /etc/xprofile ] && source /etc/xprofile
[ -f ~/.xprofile ] && source ~/.xprofile

xrdb ~/.Xdefaults
xmodmap ~/.Xmodmap

xset b off
