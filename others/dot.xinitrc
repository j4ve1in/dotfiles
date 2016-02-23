xbacklight -set 1
nitrogen --restore &
compton &
urxvtd -q -f -o

xrdb ~/.Xdefaults
xmodmap ~/.Xmodmap

xset b off
