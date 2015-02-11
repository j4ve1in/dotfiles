autoload -Uz compinit
compinit
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{cyan}Completing %B%d%b%f'

source ~/.zsh/plugin/cdd/cdd

chpwd() {
    _cdd_chpwd
}
