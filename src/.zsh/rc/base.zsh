stty stop undef

setopt no_beep
setopt extended_glob
setopt print_eight_bit
setopt interactive_comments

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
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
[[ ! -d $XDG_CACHE_HOME/zsh ]] && mkdir "$XDG_CACHE_HOME/zsh"
zstyle ':chpwd:*' recent-dirs-file "$XDG_CACHE_HOME/zsh/chpwd-recent-dirs"

## editor
zle -N editor
bindkey '^[e' editor

## git
zle -N git-tool
bindkey '^[g' git-tool

## ctrl-z
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

## Abbreviation
zle -N magic-abbrev-expand
zle -N no-magic-abbrev-expand
bindkey " " magic-abbrev-expand
bindkey "^x " no-magic-abbrev-expand

## notify
add-zsh-hook preexec remember-cmd
add-zsh-hook precmd behind-window-notify
