autoload -Uz compinit
! is_msys && compinit -u || compinit -C

setopt auto_pushd
setopt pushd_ignore_dups
setopt list_packed
setopt list_types
setopt correct
setopt complete_in_word

: "Completion" && () {
  local DEFAULT=$'%{\e[m%}'
  local RED=$'%{\e[1;31m%}'
  local COLOR_46_B=$'%{\e[1;38;5;46;49m%}'
  local COLOR_75_B=$'%{\e[1;38;5;75;49m%}'
  local COLOR_93_B=$'%{\e[1;38;5;93;49m%}'

  zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
  zstyle ':completion:*' group-name ''
  zstyle ':completion:*' list-separator '-->'
  zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
  zstyle ':completion:*' use-cache true
  zstyle ':completion:*:cd:*' ignore-parents parent pwd
  zstyle ':completion:*:default' menu select=2
  zstyle ':completion:*:manuals' separate-sections true
  zstyle ':completion:*:*:kill:*' list-colors '=(#b) #([0-9]#)*( *[a-z])*=1;34'
  zstyle ':completion:*:messages' format $COLOR_46_B'%d'$DEFAULT
  zstyle ':completion:*:warnings' format $RED'No matches for:'$DEFAULT' %d'
  zstyle ':completion:*:corrections' format $COLOR_93_B'%B%d '$RED'(errors: %e)%b'$DEFAULT
  zstyle ':completion:*:descriptions' format $COLOR_75_B'Completing %B%d%b%f'$DEFAULT
}

zmodload -i zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

setopt auto_cd
autoload -Uz add-zsh-hook
autoload -Uz ls_abbrev
add-zsh-hook chpwd ls_abbrev
