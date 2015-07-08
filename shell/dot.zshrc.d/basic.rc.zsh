bindkey -v
setopt no_beep

# Delete overlapping environment variable
typeset -U path cdpath fpath manpath

tored() {
  perl -pe 's/^/\e[0;38;5;161m/ && s/$/\e[m/'
}
alias -g E='2> >(tored)'

# zman
function zman() {
  PAGER="less -g -s '+/^       "$1"'" man zshall
}
