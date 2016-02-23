#SOUND_FILE="/usr/share/sounds/freedesktop/stereo/audio-volume-change.oga"
#pamixer --decrease 1 && paplay $SOUND_FILE
amixer -D pulse set Master 1- && paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga &
