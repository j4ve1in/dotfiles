has() { type $1 >/dev/null 2>&1; }

[ `uname` != Darwin ] && eval `dircolors -b ~/.dir_colors`

stty stop undef

# Launch tmux
# if not inside a tmux session, and if no session is started,
# start a new session
if has tmux && [ -z "$TMUX" ]; then
  tmux attach -d >/dev/null 2>&1 || tmux
fi

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
bindkey '^[f' forward-word
bindkey '^[b' backward-word

# Delete overlapping environment variable
typeset -U path cdpath fpath manpath

# zman
zman() { PAGER="less -g -s '+/^       "$1"'" man zshall; }

# Abbreviation
setopt extended_glob

typeset -A abbreviations
abbreviations=(
  "F"   "| fzf-tmux"
  "G"   "| grep"
  "X"   "| xargs"
  "T"   "| tail"
  "H"   "| head"
  "C"   "| cat"
  "W"   "| wc"
  "L"   "| less"
  "A"   "| awk"
  "S"   "| sed"
  "E"   "2>&1 > /dev/null"
  "N"   "> /dev/null"
)

magic-abbrev-expand() {
  local MATCH
  LBUFFER=${LBUFFER%%(#m)[-_a-zA-Z0-9]#}
  LBUFFER+=${abbreviations[$MATCH]:-$MATCH}
  zle self-insert
}

no-magic-abbrev-expand() { LBUFFER+=' '; }

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

zle -N magic-abbrev-expand
zle -N no-magic-abbrev-expand
bindkey " " magic-abbrev-expand
bindkey "^x " no-magic-abbrev-expand

autoload -Uz zmv
alias zmv='noglob zmv -W'
