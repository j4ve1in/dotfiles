setopt extended_glob
zmodload zsh/terminfo
autoload -Uz add-zsh-hook

for f in ~/.local/lib/zsh/^init.zsh; do . "$f"; done
