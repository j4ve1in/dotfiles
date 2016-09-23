# Profiling configuration files of zsh
# zmodload zsh/zprof && zprof

export ZDOTDIR="$HOME/.zsh"
fpath=( $fpath $ZDOTDIR/autoload/lib(N-/) )
autoload -Uz vital && vital set

export PAGER='less'
if [ -n "$DISPLAY" ]; then
  has chromium && export BROWSER='chromium'
else
  has w3m && export BROWSER='w3m'
fi

# XDG
[[ ! -d ~/.config ]] && mkdir ~/.config
[[ ! -d ~/.cache ]] && mkdir ~/.cache
[[ ! -d ~/.local/share ]] && mkdir -p ~/.local/share
export XDG_{CONFIG,CACHE,DATA}_HOME
XDG_CONFIG_HOME=~/.config
XDG_CACHE_HOME=~/.cache
XDG_DATA_HOME=~/.local/share

# Ruby
has ruby && export KCODE='u'

# Go
has go && [ -d "$HOME/.local" ] && export GOPATH="$HOME/.local"

# node
[[ ! -d $XDG_CONFIG_HOME/npm/ ]] && mkdir "$XDG_CONFIG_HOME/npm/"
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

# Editor
has vi && export EDITOR='vi'
has vim && export EDITOR='vim -p'
has nvim && export EDITOR='nvim -p'

# Less
export LESS='-ciMR' LESS_TERMCAP_{mb,md,me,se,so,ue,us}
LESS_TERMCAP_mb=`echo "\e[1;31m"`
LESS_TERMCAP_md=`echo "\e[1;38;05;75m"`
LESS_TERMCAP_me=`echo "\e[0m"`
LESS_TERMCAP_se=`echo "\e[0m"`
LESS_TERMCAP_so=`echo "\e[1;44m"`
LESS_TERMCAP_ue=`echo "\e[0m"`
LESS_TERMCAP_us=`echo "\e[1;36m"`
[[ ! -d $XDG_CACHE_HOME/less/ ]] && mkdir "$XDG_CACHE_HOME/less/"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"

# path
## Delete overlapping environment variable
typeset -U path cdpath fpath manpath

path=(
  $path
  $HOME/.{local,files,tmux,zsh,config/git}/bin(N-/)
  /usr/local/heroku/bin(N-/)
)

## Anyenv
if [[ -d $XDG_DATA_HOME/anyenv ]] ; then
  export ANYENV_ROOT="$XDG_DATA_HOME/anyenv"
  path=($ANYENV_ROOT/bin(N-/) $path)
  eval "`anyenv init -`"
  for D in `ls $ANYENV_ROOT/envs`; do
    path=($ANYENV_ROOT/envs/$D/shims(N-/) $path)
  done
fi

## fpath
fpath=(
  $fpath
  $ZDOTDIR/autoload/*(N-/)
  $GOPATH/src/*/*/ghq/zsh(N-/)
)

## cdpath
cdpath=(~)

# LSCOLORS
if is_linux; then
  has dircolors && eval `dircolors -b ~/.config/dircolors`
elif is_darwin; then
  export LSCOLORS='gxfxcxdxbxegedabagacad'
  has gdircolors && eval `gdircolors -b ~/.config/dircolors`
fi

# vagrant
if has vagrant; then
  [[ ! -d $XDG_DATA_HOME/vagrant ]] && mkdir "$XDG_DATA_HOME/vagrant"
  export VAGRANT_HOME=$XDG_DATA_HOME/vagrant
  export VAGRANT_DEFAULT_PROVIDER='virtualbox'
fi

# Others
[[ ! -d $XDG_RUNTIME_DIR/urxvt ]] && mkdir "$XDG_RUNTIME_DIR/urxvt"
export RXVT_SOCKET="$XDG_RUNTIME_DIR/urxvt/urxvt-`hostname`"

## dctl
export DROOT=~/.config/dotfiles
export DPATH="$DROOT/src"
export DTARGET="$DPATH/.{,config/}*"

## zsh
[[ ! -d $XDG_CACHE_HOME/zsh ]] && mkdir "$XDG_CACHE_HOME/zsh"
export HISTFILE="$XDG_CACHE_HOME/zsh/history"
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export {HISTSIZE,SAVEHIST}=1000

[[ -f ~/.zshenv.local ]] && . ~/.zshenv.local

vital unset
