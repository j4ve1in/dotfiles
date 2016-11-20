export ZDOTDIR="$HOME/.zsh"
. $ZDOTDIR/lib/init.zsh set

# base
export PAGER='less'
export MANUAL='man'
has nvim && export EDITOR='nvim -p'
has vtop && export ACTIVITY='vtop -t brew'
has ncmpcpp && export MUSICPLAYER='ncmpcpp'
has wifi-menu && export NETWORKMANAGER='sudo wifi-menu -o'
has lpass && export PASSWORDMANAGER='lpass login "$LPASS_USERNAME"'
has trans && export TRANSLATION='trans -pager $PAGER'
has chromium && export BROWSER='chromium'
[[ -z $DISPLAY ]] && export TMOUT="$(( 60*10 ))"

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
  $HOME/.{local,zsh}/bin(N-/)
  /usr/local/heroku/bin(N-/)
)

if [[ -d $XDG_DATA_HOME/anyenv ]] ; then
  export ANYENV_ROOT="$XDG_DATA_HOME/anyenv"
  path=($ANYENV_ROOT/bin(N-/) $path)
  eval "`anyenv init -`"
  for D in `ls $ANYENV_ROOT/envs`; do
    path=($ANYENV_ROOT/envs/$D/shims(N-/) $path)
  done
fi

fpath=(
  $fpath
  $ZDOTDIR/autoload/*(N-/)
  $GOPATH/src/*/*/ghq/zsh(N-/)
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
if is-linux; then
  has dircolors && eval `dircolors -b ~/.config/dircolors`
elif is-darwin; then
  export LSCOLORS='gxfxcxdxbxegedabagacad'
  has gdircolors && eval `gdircolors -b ~/.config/dircolors`
fi

# vagrant
if has vagrant; then
  export VAGRANT_HOME=$XDG_DATA_HOME/vagrant
  [[ ! -d $VAGRANT_HOME ]] && mkdir $VAGRANT_HOME
  export VAGRANT_DEFAULT_PROVIDER='virtualbox'
fi

# nvim
export NVIM_CACHE_HOME=$XDG_CACHE_HOME/nvim
[[ ! -d $NVIM_CACHE_HOME ]] && mkdir $NVIM_CACHE_HOME
export NVIM_DATA_HOME=$XDG_DATA_HOME/nvim
[[ ! -d $NVIM_DATA_HOME ]] && mkdir $NVIM_DATA_HOME
export DEIN_HOME=$NVIM_DATA_HOME/dein

# tmux
export TMUX_CACHE_HOME=$XDG_CACHE_HOME/tmux
[[ ! -d $TMUX_CACHE_HOME ]] && mkdir $TMUX_CACHE_HOME
export TMUX_DATA_HOME=$XDG_DATA_HOME/tmux
[[ ! -d $TMUX_DATA_HOME ]] && mkdir $TMUX_DATA_HOME
export TPM_HOME=$TMUX_DATA_HOME/tpm

# zsh
export ZSH_CACHE_HOME=$XDG_CACHE_HOME/zsh
[[ ! -d $ZSH_CACHE_HOME ]] && mkdir $ZSH_CACHE_HOME
export ZSH_DATA_HOME=$XDG_DATA_HOME/zsh
[[ ! -d $ZSH_DATA_HOME ]] && mkdir $ZSH_DATA_HOME
export HISTFILE="$ZSH_CACHE_HOME/history"
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export {HISTSIZE,SAVEHIST}=1000
export ZPLUG_HOME=$ZSH_DATA_HOME/zplug
export ZPLUG_CACHE_FILE=$ZSH_CACHE_HOME/zplug/cache

# dctl
export DCTL_PATH=$XDG_CONFIG_HOME/dotfiles/src

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
'
has tmux && export SELECTOR='fzf-tmux'
[[ -z $TMUX ]] && export SELECTOR='fzf'

# dmenu
export DMENU_CONFIG_FILE=$XDG_CONFIG_HOME/dmenurc
[[ -f $DMENU_CONFIG_FILE ]] && . $DMENU_CONFIG_FILE || export DMENU=''

# local
[[ -f ~/.zshenv.local ]] && . ~/.zshenv.local

. $ZDOTDIR/lib/init.zsh unset
