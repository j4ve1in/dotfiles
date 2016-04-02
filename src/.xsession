if type xcape; then
  # SandS
  (
    sleep 5
    xmodmap -e 'keycode 255=space'
    xmodmap -e 'keycode 65=Shift_L'
    xcape -e '#65=space'
  ) &
  xcape # ctrl = esc
fi
