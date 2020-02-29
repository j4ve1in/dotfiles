if [[ -z $DISPLAY ]] && [[ $XDG_VTNR = 1 ]]; then
  exec startx >/dev/null 2>&1
fi

if [[ -n $DISPLAY ]] && [[ $XDG_VTNR = 1 ]]; then
  if tmux has-session >/dev/null 2>&1; then
    exec tmux attach -d >/dev/null 2>&1
  else
    exec tmux
  fi
fi

exec fish
