: 'Autoload functions and Create user-defined widget' && () {
  private dir="$ZDOTDIR/autoload"

  autoload -Uz `ls -F $dir/**/* | grep -v /`

  private w
  for w in `ls $dir/widgets/`; do; zle -N $w; done
}

# Support zsh-autosuggestions
if [[ -n ZSH_AUTOSUGGEST_IGNORE_WIDGETS ]]; then
  ZSH_AUTOSUGGEST_IGNORE_WIDGETS=(
    $ZSH_AUTOSUGGEST_IGNORE_WIDGETS
    `ls $ZDOTDIR/autoload/widgets/`
  )
fi
