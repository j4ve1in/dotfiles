export HISTFILE="${HOME}/.zsh/.zsh_history"
export {HISTSIZE,SAVEHIST,HISTFILESIZE}=100
setopt hist_expand
setopt share_history
setopt hist_no_store
setopt extended_history
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt inc_append_history
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
