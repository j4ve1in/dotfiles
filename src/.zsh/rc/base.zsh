has() { type $1 >/dev/null 2>&1; }

stty stop undef

setopt no_beep
setopt print_eight_bit
setopt interactive_comments

# help
autoload -Uz run-help
autoload -Uz run-help-git

# vi mode
bindkey -v
bindkey "^G" send-break
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char
bindkey '^D' delete-char-or-list
bindkey '^W' backward-kill-word
bindkey '^U' backward-kill-line
bindkey '^[[Z' reverse-menu-complete
bindkey '^[h' run-help
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^F' forward-char
bindkey '^B' backward-char
bindkey '^K' kill-line
bindkey '^[f' forward-word
bindkey '^[b' backward-word

# history
setopt hist_expand
setopt share_history
setopt hist_no_store
setopt extended_history
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt inc_append_history
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# user-defined
autoload -Uz mcd
autoload -Uz search
autoload -Uz ssh-add
autoload -Uz ssh-add-with-lpass
autoload -Uz trash
autoload -Uz zman

## ctrl-z
autoload -Uz fancy-ctrl-z
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

## Abbreviation
setopt extended_glob
autoload -Uz magic-abbrev-expand
autoload -Uz no-magic-abbrev-expand
zle -N magic-abbrev-expand
zle -N no-magic-abbrev-expand
bindkey " " magic-abbrev-expand
bindkey "^x " no-magic-abbrev-expand
