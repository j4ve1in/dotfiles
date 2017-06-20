. ~/.local/lib/zsh/init.zsh

is-arch && . ~/.zshenv

# Launch tmux
if has tmux && [[ -z $TMUX ]]; then
  exec mux-loader
fi

: "Install tmux plugin manager" && () {
  private -A dir
  dir=(
    plugin "$TMUX_PLUGIN_MANAGER_PATH"
    cache  "$HOME/.cache/tmux/plugins"
  )
  if [[ ! -d $dir[plugin] ]] && [[ ! -f $dir[cache]/confirmed ]]; then
    mkdir -p "$dir[cache]"
    touch "$dir[cache]/confirmed"
    tmux confirm-before -p 'Do you install plugin manager?' "run-shell '
      git clone https://github.com/tmux-plugins/tpm $dir[cache]/tpm
      tmux display \"Installed tmux plugins\"
    '"
  fi
}

: 'Catenate configuration files of zsh' && () {
  private -a file
  file=( $ZDOTDIR/rc/{plugins,base,aliases,completion}.zsh )
  [[ -f $ZDOTDIR/rc/local.zsh ]] && file+=$ZDOTDIR/rc/local.zsh

  for f in $file; do
    if [[ ! -f $ZDOTDIR/.zshrc || $f -nt $ZDOTDIR/.zshrc ]]; then
      print-header 'Catenate configuration files of zsh'
      private mark=`print-color-bold '>' "$fg[accent]"`
      print " $ZDOTDIR/rc/* $mark $ZDOTDIR/.zshrc"
      private initialize='. ~/.local/lib/zsh/init.zsh'
      cat <(<<< $initialize) $file > $ZDOTDIR/.zshrc
      return 0
    fi
  done
}
