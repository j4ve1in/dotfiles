stty stop undef

setopt no_beep
setopt print_eight_bit
setopt interactive_comments

# dotfiles
printf '%s\n' $DDIR/.* | egrep -v '\.ignore|\.config|README' > $DFILE

# keybind
## vi mode
bindkey -v

### emacs like
bindkey -v '^G' send-break
bindkey -v '^H' backward-delete-char
bindkey -v '^W' backward-kill-word
bindkey -v '^U' backward-kill-line
bindkey -v '^K' kill-line
bindkey -v '^D' delete-char-or-list
bindkey -v '^A' beginning-of-line
bindkey -v '^E' end-of-line
bindkey -v '^F' forward-char
bindkey -v '^B' backward-char

## others
bindkey -v '^[[Z' reverse-menu-complete

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
autoload -Uz ssh-add{,-with-lpass}
autoload -Uz trash
autoload -Uz xrandr-{extend,main,sub}
autoload -Uz pctl
autoload -Uz agit

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

## notify
autoload -Uz add-zsh-hook
autoload -Uz remember-cmd
autoload -Uz behind-window-notify
add-zsh-hook preexec remember-cmd
add-zsh-hook precmd behind-window-notify
