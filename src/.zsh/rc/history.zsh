export HISTFILE="${HOME}/.zsh/.zsh_history"
export {HISTSIZE,SAVEHIST,HISTFILESIZE}=100
setopt hist_reduce_blanks
setopt share_history
setopt EXTENDED_HISTORY
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
