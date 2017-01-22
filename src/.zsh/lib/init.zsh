if [[ $1 = set ]]; then
  setopt extended_glob
  zmodload zsh/terminfo
  autoload -Uz add-zsh-hook

  for f in $ZDOTDIR/lib/^init.zsh; do . "$f"; done
  echoti civis
elif [[ $1 = unset ]]; then
  echoti cnorm
fi
