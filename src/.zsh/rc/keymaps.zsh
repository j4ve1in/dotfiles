# base
stty stop undef
bindkey -v
bindkey -v '^[[Z' reverse-menu-complete
bindkey -v '^_' reload

# emacs like
bindkey -v '^H' backward-delete-char
bindkey -v '^W' backward-kill-word
bindkey -v '^U' backward-kill-line
bindkey -v '^K' kill-line
bindkey -v '^D' delete-char-or-list
bindkey -v '^A' beginning-of-line
bindkey -v '^E' end-of-line
bindkey -v '^F' forward-char
bindkey -v '^B' backward-char

# history
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^P' history-beginning-search-backward-end
bindkey '^N' history-beginning-search-forward-end

# menu select
zmodload -i zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
