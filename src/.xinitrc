# Base
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
xbacklight = 2 &           # Brightness
sh ~/.fehbg &              # Wallpaper
compton -b &               # Compositor
tmux new-session -s 0 -d & # Multiplexer
tpctl disable &            # Touchpad
dunst &                    # Notification daemon
sxhkd &                    # Hotkey daemon
xcape &                    # Utility for a modifier key

# Imput Method
export GTK_IM_MODULE=fcitx QT_IM_MODULE=fcitx XMODIFIERS='@im=fcitx'
fcitx &
## Override fcitx settings
setxkbmap -option ctrl:nocaps
setxkbmap -option terminate:ctrl_alt_bksp

# Screen locker
xautolock \
  -time 10 \
  -locker lock \
  -notify 30 \
  -notifier "notify-send xautolock 'LOCKING screen in 30 seconds'" &

# Password Manager
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Load .xinitrc.local
[[ -f $HOME/.xinitrc.local ]] && . $HOME/.xinitrc.local

# Window Manager
[[ -d $XDG_CACHE_HOME/xmonad/ ]] && mkdir -p $XDG_CACHE_HOME/xmonad/
[[ -d $XDG_DATA_HOME/xmonad/ ]] && mkdir -p $XDG_DATA_HOME/xmonad/
exec xmonad

# vim: filetype=sh
