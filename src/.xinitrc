# Base
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
xbacklight = 2 &           # Brightness
sh ~/.fehbg &              # Wallpaper
compton -b &               # Compositor
tmux new-session -s 0 -d & # Multiplexer
tpctl disable &            # Touchpad
mopidy &                   # Music server
dunst &                    # Notification daemon
dropbox-cli start &        # File sharing system
sxhkd &                    # Hotkey daemon

# Imput Method
export GTK_IM_MODULE=fcitx QT_IM_MODULE=fcitx XMODIFIERS='@im=fcitx'
fcitx &

# Screen locker
xautolock \
  -time 10 \
  -locker lock \
  -notify 30 \
  -notifier "notify-send xautolock 'LOCKING screen in 30 seconds'" &

# Password Manager
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Window Manager
exec xmonad

# vim: filetype=sh
