. ~/.local/lib/zsh/init.zsh

is-arch && . ~/.zshenv

: "Launch tmux" && () {
  if has tmux && [[ -z $TMUX ]]; then
    exec mux-loader
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
