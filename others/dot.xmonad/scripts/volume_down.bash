SOUND_FILE="/usr/share/sounds/freedesktop/stereo/audio-volume-change.oga"
pamixer --decrease 1 && paplay $SOUND_FILE
