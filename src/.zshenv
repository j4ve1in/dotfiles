# XDG
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share

# base
export PAGER='less'
export EDITOR='nvim -p'
export DIFFPROG='nvim -d'
export TERMINAL='termite'
eval `dircolors -b $XDG_CONFIG_HOME/dircolors`
export EXA_COLORS="$LS_COLORS"
export GPG_TTY=`tty`
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export GTK_IM_MODULE=fcitx QT_IM_MODULE=fcitx XMODIFIERS='@im=fcitx'

# path
typeset -U path PATH
path=($path $HOME/.local/bin(N-/))
path=($path $HOME/.gem/ruby/*/bin(N-/))
path=($path $HOME/.yarn/bin(N-/))

# Programming
export GOPATH="$HOME/.local"
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

# Less
export LESS='-ciMR' LESS_TERMCAP_{mb,md,me,se,so,ue,us}
LESS_TERMCAP_mb=$'\e[1;31m'
LESS_TERMCAP_md=$'\e[1;38;05;75m'
LESS_TERMCAP_me=$'\e[0m'
LESS_TERMCAP_se=$'\e[0m'
LESS_TERMCAP_so=$'\e[1;44m'
LESS_TERMCAP_ue=$'\e[0m'
LESS_TERMCAP_us=$'\e[1;36m'
export LESS_CACHE_HOME=$XDG_CACHE_HOME/less
export LESSHISTFILE="$LESS_CACHE_HOME/history"

# fzf
export FZF_DEFAULT_OPTS="
  --ansi
  --exit-0
  --extended
  --cycle
  --multi
  --height 40%
  --reverse
  --prompt='▶ '
  --color hl:27,bg+:21,hl+:75
  --color info:69,prompt:75,spinner:69,pointer:69,marker:69
  --bind ctrl-j:jump-accept
"

# AWS
export AWS_SDK_LOAD_CONFIG=1
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"

# local
[[ -f ~/.zshenv.local ]] && . ~/.zshenv.local
