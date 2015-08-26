setopt no_beep
setopt print_eight_bit
setopt interactive_comments
autoload -U colors && colors

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

# Delete overlapping environment variable
typeset -U path cdpath fpath manpath

# zman
function zman() {
  PAGER="less -g -s '+/^       "$1"'" man zshall
}
