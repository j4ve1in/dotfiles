# XDG
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share

# base
export PAGER=less
export EDITOR=nvim
export DIFFPROG='nvim -d'
eval `dircolors -b $XDG_CONFIG_HOME/dircolors | sed 's/LS_COLORS/EXA_COLORS/g'`
EXA_COLORS+="ur=1;38;5;27:uw=1;38;5;75:"
EXA_COLORS+="gr=;38;5;27:gw=38;5;75:"
EXA_COLORS+="tr=;38;5;27:tw=38;5;75:"
EXA_COLORS+="da=1;38;5;27:"
EXA_COLORS+="sn=1;38;5;75:sb=38;5;75:"
EXA_COLORS+="uu=38;5;245:gm=1;38;5;27:lp=38;5;245"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS='@im=fcitx'
export _JAVA_AWT_WM_NONREPARENTING=1

# path
typeset -U path PATH
path=($HOME/.local/bin(N-/) $path)
path=($path $HOME/.gem/ruby/*/bin(N-/))
path=($path $XDG_DATA_HOME/npm/bin(N-/))
path=($path $HOME/.krew/bin(N-/))

# Programming
export GOPATH="$HOME/.local"
export GO111MODULE=on
export NODE_PATH="$XDG_DATA_HOME/yarn/global/node_modules/"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

# Less
export LESS='-ciMR'
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;38;05;75m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;44m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;36m'
export LESS_CACHE_HOME="$XDG_CACHE_HOME/less"
export LESSHISTFILE="$LESS_CACHE_HOME/history"

# fzf
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
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

# Minikube
export MINIKUBE_WANTUPDATENOTIFICATION=false
export MINIKUBE_WANTREPORTERRORPROMPT=false
export MINIKUBE_HOME="$HOME"
export CHANGE_MINIKUBE_NONE_USER=true
export KUBECONFIG="$XDG_CONFIG_HOME/kubernetes/minikube"

# local
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
