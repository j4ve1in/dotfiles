bindkey -v
setopt no_beep
autoload -U colors && colors

# Delete overlapping environment variable
typeset -U path cdpath fpath manpath

# zman
function zman() {
  PAGER="less -g -s '+/^       "$1"'" man zshall
}
