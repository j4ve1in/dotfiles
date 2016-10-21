export ZDOTDIR="$HOME/.zsh"
. $ZDOTDIR/lib/init.zsh set

# base
export PAGER='less'
has nvim && export EDITOR='nvim -p'
has chromium && export BROWSER='chromium'

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
  $HOME/.{local,tmux,zsh,config/git}/bin(N-/)
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
[[ ! -d $XDG_CONFIG_HOME/npm/ ]] && mkdir "$XDG_CONFIG_HOME/npm/"
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

# urxvt
if has urxvt && [[ $DISPLAY ]]; then
  [[ ! -d $XDG_RUNTIME_DIR/urxvt ]] && mkdir "$XDG_RUNTIME_DIR/urxvt"
  export RXVT_SOCKET="$XDG_RUNTIME_DIR/urxvt/urxvt-`hostname`"
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
[[ ! -d $XDG_CACHE_HOME/less/ ]] && mkdir "$XDG_CACHE_HOME/less/"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"

# LSCOLORS
if is-linux; then
  has dircolors && eval `dircolors -b ~/.config/dircolors`
elif is-darwin; then
  export LSCOLORS='gxfxcxdxbxegedabagacad'
  has gdircolors && eval `gdircolors -b ~/.config/dircolors`
fi

# vagrant
if has vagrant; then
  [[ ! -d $XDG_DATA_HOME/vagrant ]] && mkdir "$XDG_DATA_HOME/vagrant"
  export VAGRANT_HOME=$XDG_DATA_HOME/vagrant
  export VAGRANT_DEFAULT_PROVIDER='virtualbox'
fi

# dctl
export DROOT=~/.config/dotfiles
export DPATH="$DROOT/src"
export DTARGET="$DPATH/.{,config/}*"

# zsh
[[ ! -d $XDG_CACHE_HOME/zsh ]] && mkdir "$XDG_CACHE_HOME/zsh"
export HISTFILE="$XDG_CACHE_HOME/zsh/history"
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export {HISTSIZE,SAVEHIST}=1000

# local
[[ -f ~/.zshenv.local ]] && . ~/.zshenv.local

. $ZDOTDIR/lib/init.zsh unset
