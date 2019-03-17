#!/bin/sh

# Base
xbacklight -set 3 &                      # Brightness
sh ~/.fehbg &                            # Wallpaper
compton -b &                             # Compositor
tmux new-session -s 0 -d &               # Multiplexer
dunst &                                  # Notification daemon
unclutter &                              # Utility for cursor

# Hotkey daemon
if [[ -f $XDG_CONFIG_HOME/sxhkd/local.sxhkd ]]; then
  sxhkd -m -1 \
    "$XDG_CONFIG_HOME/sxhkd/local.sxhkd" &
else
  sxhkd &
fi

# Imput Method
fcitx &
## Override fcitx settings
setxkbmap -option ctrl:nocaps
setxkbmap -option terminate:ctrl_alt_bksp
## Utility for a modifier key
xcape &

# Screen locker
xautolock \
  -locker lock \
  -notify 30 \
  -notifier "notify-send -t 10000 xautolock 'LOCKING screen in 30 seconds'" &
xss-lock -- lock &

# Password Manager
dbus-update-activation-environment --systemd DISPLAY
eval "$(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)"
export SSH_AUTH_SOCK

# Load .xinitrc.local
# shellcheck source=/dev/null
[ -f "$HOME/.xinitrc.local" ] && . "$HOME/.xinitrc.local"

# Window Manager
xsetroot -cursor_name left_ptr # for bspwm
exec bspwm
