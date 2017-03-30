export ZDOTDIR="$HOME/.zsh"
. $ZDOTDIR/lib/init.zsh set

# base
export PAGER='less'
export MANUAL='man'
has nvim && export EDITOR='nvim -p'
has vtop && export SYSTEMACTIVITY='vtop -t brew'
has ncmpcpp && export MUSICPLAYER='ncmpcpp'
has wifi-menu && export NETWORKMANAGER='sudo wifi-menu -o'
has lpass && export PASSWORDMANAGER='lpass login --trust "$LPASS_USERNAME"'
has trans && export TRANSLATION='trans -pager $PAGER'
has chromium && export BROWSER='chromium'
[[ -z $DISPLAY ]] && export TMOUT="$(( 60*10 ))"
if has tmux && [[ $DISPLAY ]]; then
  export TERM=screen-256color
fi
if [[ $HOST = localhost ]]; then
  export MAIN_DISPLAY=eDP1 SUB_DISPLAY=HDMI1
  export MOUSE='SynPS/2 Synaptics TouchPad'
fi

# XDG
[[ ! -d ~/.config ]] && mkdir ~/.config
[[ ! -d ~/.cache ]] && mkdir ~/.cache
[[ ! -d ~/.local/share ]] && mkdir -p ~/.local/share
export XDG_{CONFIG,CACHE,DATA}_HOME
XDG_CONFIG_HOME=~/.config
XDG_CACHE_HOME=~/.cache
XDG_DATA_HOME=~/.local/share

# path
typeset -U path fpath cdpath

path=(
  $path
  $HOME/.{local,zsh,tmux,config/{git,xmonad}}/bin(N-/)
  /usr/local/heroku/bin(N-/)
)

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

cdpath=(~)

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

# tmux
export TMUX_CACHE_HOME=$XDG_CACHE_HOME/tmux
[[ ! -d $TMUX_CACHE_HOME ]] && mkdir $TMUX_CACHE_HOME
export TMUX_DATA_HOME=$XDG_DATA_HOME/tmux
[[ ! -d $TMUX_DATA_HOME ]] && mkdir $TMUX_DATA_HOME
export TMUX_PLUGIN_MANAGER_PATH=$TMUX_DATA_HOME/plugins
[[ ! -d $TMUX_PLUGIN_MANAGER_PATH ]] && mkdir $TMUX_PLUGIN_MANAGER_PATH
export TPM_HOME=$TMUX_PLUGIN_MANAGER_PATH/tpm

# zsh
export ZSH_CACHE_HOME=$XDG_CACHE_HOME/zsh
[[ ! -d $ZSH_CACHE_HOME ]] && mkdir $ZSH_CACHE_HOME
export ZSH_DATA_HOME=$XDG_DATA_HOME/zsh
[[ ! -d $ZSH_DATA_HOME ]] && mkdir $ZSH_DATA_HOME
export HISTFILE="$ZSH_CACHE_HOME/history"
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export {HISTSIZE,SAVEHIST}=10000
export ZPLUG_HOME=$ZSH_DATA_HOME/plugins
export ZPLUG_CACHE_DIR=$ZSH_CACHE_HOME/plugins/zplug/cache
[[ ! -d $ZPLUG_CACHE_DIR ]] && mkdir -p $ZPLUG_CACHE_DIR

# dctl
export DOT_HOME=~/.local/src/github.com/ytet5uy4/dotfiles
export DOT_BASE_DIR=$DOT_HOME/src

# gomi
export GOMI_DIR=$XDG_DATA_HOME/gomi

# fzf
export FZF_DEFAULT_OPTS='
  --ansi
  --select-1
  --exit-0
  --extended
  --cycle
  --multi
  --color fg:15,bg:16,hl:27,fg+:15,bg+:21,hl+:75
  --color info:69,prompt:75,spinner:69,pointer:69,marker:69
  --bind ctrl-j:jump-accept
'

# dmenu
export DMENU='-i -sb #00008b -nb black -fn Migu1M:size=13.5'

# aws
export AWS_SDK_LOAD_CONFIG=1

# lpass
export LPASS_USERNAME=ytet5uy4@outlook.com

# local
[[ -f ~/.zshenv.local ]] && . ~/.zshenv.local

. $ZDOTDIR/lib/init.zsh unset
