autoload -Uz compinit
dumpfile=$XDG_CACHE_HOME/zsh/compdump
[[ ! -d $XDG_CACHE_HOME/zsh ]] && mkdir "$XDG_CACHE_HOME/zsh"
compinit -u -d $dumpfile
[[ ! -d $XDG_CACHE_HOME/zsh ]] && mkdir "$XDG_CACHE_HOME/zsh"
zstyle ':completion:*:complete:*' cache-path $XDG_CACHE_HOME/zsh/compcache/

setopt auto_pushd
setopt pushd_ignore_dups
setopt list_packed
setopt list_types
setopt correct
setopt complete_in_word

: "Completion" && () {
  private -A fg
  fg=(
    default $'%{\e[0m%}'
    main    $'%{\e[1;38;5;75;49m%}'
    sub     $'%{\e[1;38;5;93;49m%}'
    accent  $'%{\e[1;38;5;46;49m%}'
    error   $'%{\e[1;31m%}'
    warning $'%{\e[1;31m%}'
  )

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
  zstyle ':completion:*:messages' format $fg[accent]'%d'$fg[default]
  zstyle ':completion:*:warnings' format $fg[warning]'No matches for:'$fg[default]' %d'
  zstyle ':completion:*:corrections' format $fg[sub]'%B%d '$fg[error]'(errors: %e)%b'$fg[default]
  zstyle ':completion:*:descriptions' format $fg[main]'Completing %B%d%b%f'$fg[default]
}

zmodload -i zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

setopt auto_cd
add-zsh-hook chpwd ls_abbrev
