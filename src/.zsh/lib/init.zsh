setopt extended_glob
zmodload zsh/terminfo
autoload -Uz add-zsh-hook

for f in $ZDOTDIR/lib/^init.zsh; do . "$f"; done
