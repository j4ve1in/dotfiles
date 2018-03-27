#!/bin/sh

# Base
xbacklight = 3 &           # Brightness
sh ~/.fehbg &              # Wallpaper
compton -b &               # Compositor
tmux new-session -s 0 -d & # Multiplexer
tpctl disable &            # Touchpad
dunst &                    # Notification daemon
sxhkd -m -1 &              # Hotkey daemon

# Imput Method
fcitx &
## Override fcitx settings
setxkbmap -option ctrl:nocaps
setxkbmap -option terminate:ctrl_alt_bksp
## Utility for a modifier key
xcape &

# Screen locker
xautolock \
  -time 10 \
  -locker lock \
  -notify 30 \
  -notifier "notify-send xautolock 'LOCKING screen in 30 seconds'" &
xss-lock -- lock &

# Password Manager
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Load .xinitrc.local
[[ -f $HOME/.xinitrc.local ]] && . $HOME/.xinitrc.local

# Window Manager
xsetroot -cursor_name left_ptr # for bspwm
exec bspwm
