#!/bin/sh

# Base
xbacklight = 3 &                         # Brightness
sh ~/.fehbg &                            # Wallpaper
compton -b &                             # Compositor
tmux new-session -s 0 -d &               # Multiplexer
dunst &                                  # Notification daemon
unclutter &                              # Utility for cursor
sxhkd -m -1 \
  $XDG_CONFIG_HOME/sxhkd/sxhkdrc.local & # Hotkey daemon

# Imput Method
fcitx &
## Override fcitx settings
setxkbmap -option ctrl:nocaps
setxkbmap -option terminate:ctrl_alt_bksp
## Utility for a modifier key
xcape &

# Screen locker
xautolock \
  -locker 'i3lock -euni $XDG_DATA_HOME/i3/lockscreen.png -c 000000' \
  -notify 30 \
  -notifier "notify-send -t 10000 xautolock 'LOCKING screen in 30 seconds'" &
xss-lock -- i3lock -euni $XDG_DATA_HOME/i3/lockscreen.png -c 000000 &

# Password Manager
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Load .xinitrc.local
[[ -f $HOME/.xinitrc.local ]] && . $HOME/.xinitrc.local

# Window Manager
xsetroot -cursor_name left_ptr # for bspwm
exec bspwm
