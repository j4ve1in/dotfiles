autoload -Uz `ls -F $ZDOTDIR/autoload/**/* | grep -v /`

: 'Create user-defined widget' && () {
  private w
  for w in `ls $ZDOTDIR/autoload/widgets/`; do; zle -N $w; done
}

## Support zsh-autosuggestions
if [[ -n ZSH_AUTOSUGGEST_IGNORE_WIDGETS ]]; then
  ZSH_AUTOSUGGEST_IGNORE_WIDGETS=(
    $ZSH_AUTOSUGGEST_IGNORE_WIDGETS
    `ls $ZDOTDIR/autoload/widgets/`
  )
fi
