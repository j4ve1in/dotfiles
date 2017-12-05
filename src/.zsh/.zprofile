[ -e /etc/arch-release ] && . ~/.zshenv

# Launch xmonad
if [[ $XDG_VTNR = 1 ]] && [[ -z $DISPLAY ]]; then
  [[ ! -d $XDG_CONFIG_HOME/xmonad ]] && mkdir -p "$XDG_CONFIG_HOME/xmonad"
  [[ ! -d $XDG_CACHE_HOME/xmonad ]] && mkdir -p "$XDG_CACHE_HOME/xmonad"
  [[ ! -d $XDG_DATA_HOME/xmonad ]] && mkdir -p "$XDG_DATA_HOME/xmonad"
  exec startx >/dev/null 2>&1
fi

# Launch tmux
if type tmux >/dev/null 2>&1 && [[ -z $TMUX ]]; then
  exec mux-loader
fi

: "Install tmux plugin manager" && () {
  private -A dir
  dir=(
    plugin "$TMUX_PLUGIN_MANAGER_PATH"
    cache  "$XDG_CACHE_HOME/tmux"
  )
  if [[ ! -d $dir[plugin] ]] && [[ ! -f $dir[cache]/confirmed ]]; then
    mkdir -p "$dir[cache]"
    touch "$dir[cache]/confirmed"
    tmux confirm-before -p 'Do you install plugin manager?' "run-shell '
      git clone https://github.com/tmux-plugins/tpm $dir[plugin]/tpm
      tpm-init
      tmux display \"Installed plugin manager\"
    '"
  fi
}
