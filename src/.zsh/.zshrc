: 'Source ~/.zsh/rc/*.zsh' && () {
  private -a file
  file=( $ZDOTDIR/rc/{lib,plugins,base,aliases,keymaps,completion}.zsh )
  [[ -f $ZDOTDIR/rc/local.zsh ]] && file+=$ZDOTDIR/rc/local.zsh

  for f in $file; do . $f; done
}
