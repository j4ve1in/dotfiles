. ~/.local/lib/zsh/init.zsh

# base
has less && export PAGER='less'
has nvim && export EDITOR='nvim -p'
[[ -z $DISPLAY ]] && export TMOUT="$(( 60*10 ))"

## XDG
export XDG_{CONFIG,CACHE,DATA}_HOME
XDG_CONFIG_HOME=~/.config
XDG_CACHE_HOME=~/.cache
XDG_DATA_HOME=~/.local/share
[[ ! -d $XDG_CACHE_HOME ]] && mkdir -p $XDG_CACHE_HOME
[[ ! -d $XDG_DATA_HOME ]] && mkdir -p $XDG_DATA_HOME

## zsh
export ZDOTDIR=~/.zsh
export ZSH_CACHE_HOME=$XDG_CACHE_HOME/zsh
[[ ! -d $ZSH_CACHE_HOME ]] && mkdir $ZSH_CACHE_HOME
export ZSH_DATA_HOME=$XDG_DATA_HOME/zsh
[[ ! -d $ZSH_DATA_HOME ]] && mkdir $ZSH_DATA_HOME
export SAVEHIST="$HISTSIZE"
export HISTFILE="$ZSH_CACHE_HOME/history"
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export ZPLUG_HOME=$ZSH_DATA_HOME/plugins
export ZPLUG_CACHE_DIR=$ZSH_CACHE_HOME/plugins/zplug/cache
[[ ! -d $ZPLUG_CACHE_DIR ]] && mkdir -p $ZPLUG_CACHE_DIR

# path
typeset -U path fpath

path=($path $HOME/.local/bin(N-/))

if has ruby && has gem; then
  path=($path `ruby -rubygems -e 'puts Gem.user_dir'`/bin(N-/))
fi

if [[ -d $XDG_DATA_HOME/anyenv ]] ; then
  export ANYENV_ROOT="$XDG_DATA_HOME/anyenv"
  path=($ANYENV_ROOT/bin(N-/) $path)
  eval "`anyenv init - --no-rehash`"
  for D in `ls $ANYENV_ROOT/envs`; do
    path=($ANYENV_ROOT/envs/$D/shims(N-/) $path)
  done
fi

fpath=(
  $fpath
  $ZDOTDIR/autoload/**/*(N-/)
)

# Programming
has ruby && export KCODE='u'
has go && [[ -d $HOME/.local ]] && export GOPATH="$HOME/.local"
export NPM_CONFIG_HOME=$XDG_CONFIG_HOME/npm
[[ ! -d $NPM_CONFIG_HOME ]] && mkdir $NPM_CONFIG_HOME
export NPM_CONFIG_USERCONFIG=$NPM_CONFIG_HOME/npmrc

# urxvt
if has urxvt && [[ $DISPLAY ]]; then
  export URXVT_RUNTIME_DIR=$XDG_RUNTIME_DIR/urxvt
  [[ ! -d $URXVT_RUNTIME_DIR ]] && mkdir $URXVT_RUNTIME_DIR
  export RXVT_SOCKET="$URXVT_RUNTIME_DIR/urxvt-`hostname`"
fi

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
[[ ! -d $LESS_CACHE_HOME ]] && mkdir $LESS_CACHE_HOME
export LESSHISTFILE="$LESS_CACHE_HOME/history"

# LSCOLORS
has dircolors && eval `dircolors -b ~/.config/dircolors`

# vagrant
if has vagrant; then
  export VAGRANT_HOME=$XDG_DATA_HOME/vagrant
  [[ ! -d $VAGRANT_HOME ]] && mkdir $VAGRANT_HOME
  export VAGRANT_DEFAULT_PROVIDER='virtualbox'
fi

# nvim
export NVIM_CONFIG_HOME=$XDG_CONFIG_HOME/nvim
export NVIM_CACHE_HOME=$XDG_CACHE_HOME/nvim
[[ ! -d $NVIM_CACHE_HOME ]] && mkdir $NVIM_CACHE_HOME
export NVIM_DATA_HOME=$XDG_DATA_HOME/nvim
[[ ! -d $NVIM_DATA_HOME ]] && mkdir $NVIM_DATA_HOME
export NVIM_PLUGIN_HOME=$NVIM_DATA_HOME/plugins
[[ ! -d $NVIM_PLUGIN_HOME ]] && mkdir $NVIM_PLUGIN_HOME
export DEIN_HOME=$NVIM_PLUGIN_HOME/repos/github.com/Shougo/dein.vim

# dctl
export DOT_HOME=~/.local/src/github.com/ytet5uy4/dotfiles
export DOT_BASE_DIR=$DOT_HOME/src

# fzf
[[ $DISPLAY ]] && fzf_prompt="`echo '\uf04b'`" || fzf_prompt='>'
export FZF_DEFAULT_OPTS="
  --ansi
  --select-1
  --exit-0
  --extended
  --cycle
  --multi
  --height 40%
  --reverse
  --prompt=\"$fzf_prompt \"
  --color hl:27,bg+:21,hl+:75
  --color info:69,prompt:75,spinner:69,pointer:69,marker:69
  --bind ctrl-j:jump-accept
"

# dmenu
export DMENU='-i -sb #00008b -nb black -fn Migu1M:size=13.5'

# aws
export AWS_SDK_LOAD_CONFIG=1

# lpass
export LPASS_USERNAME=ytet5uy4@ytet5uy4.com

# local
[[ -f ~/.zshenv.local ]] && . ~/.zshenv.local
