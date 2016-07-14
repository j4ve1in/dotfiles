# Profiling configuration files of zsh
# zmodload zsh/zprof && zprof

export ZDOTDIR="$HOME/.zsh"
fpath=( $fpath $ZDOTDIR/functions/Lib(N-/) )
autoload -Uz vital && vital set

export LANG='en_US.UTF-8'

export PAGER='less'
if [ -n "$DISPLAY" ]; then
  has chromium && export BROWSER='chromium'
else
  has w3m && export BROWSER='w3m'
fi
has vagrant && has virtualbox && export VAGRANT_DEFAULT_PROVIDER='virtualbox'

# Ruby
has ruby && export KCODE='u' # RUBYGEMS_GEMDEPS='-'

# Go
has go && [ -d "$HOME/.local" ] && export GOPATH="$HOME/.local"

# Editor
has vim && export EDITOR='vim -p' || export EDITOR='vi -p'

# Less
export LESS='-ciMR' LESS_TERMCAP_{mb,md,me,se,so,ue,us}
LESS_TERMCAP_mb=`echo "\e[1;31m"`
LESS_TERMCAP_md=`echo "\e[1;38;05;75m"`
LESS_TERMCAP_me=`echo "\e[0m"`
LESS_TERMCAP_se=`echo "\e[0m"`
LESS_TERMCAP_so=`echo "\e[1;44m"`
LESS_TERMCAP_ue=`echo "\e[0m"`
LESS_TERMCAP_us=`echo "\e[1;36m"`

# path
## Delete overlapping environment variable
typeset -U path cdpath fpath manpath

path=(
  $path
  $HOME/.local/bin(N-/)
  $HOME/.dotfiles/bin(N-/)
  $HOME/.tmux/bin(N-/)
  $HOME/.zsh/bin(N-/)
  $HOME/.git.global/bin(N-/)
  $HOME/.xmoand/bin(N-/)
  /usr/local/heroku/bin(N-/)
)

## Anyenv
if [ -d "$HOME/.anyenv" ] ; then
  path=($HOME/.anyenv/bin(N-/) $path)
  eval "`anyenv init -`"
  for D in `ls $HOME/.anyenv/envs`; do
    path=($HOME/.anyenv/envs/$D/shims(N-/) $path)
  done
fi

## fpath
fpath=(
  $fpath
  $GOPATH/src/*/*/ghq/zsh(N-/)
  $ZDOTDIR/bundle/repos/mollifier/cd-gitroot(N-/)
  $ZDOTDIR/functions/Selector(N-/)
  $ZDOTDIR/functions/Misc(N-/)
)

## cdpath
cdpath=(~)

# LSCOLORS
if is_linux || is_msys; then
  has dircolors && eval `dircolors -b ~/.zsh/.dir_colors`
elif is_darwin; then
  export LSCOLORS='gxfxcxdxbxegedabagacad'
  has gdircolors && eval `gdircolors -b ~/.zsh/.dircolors`
fi

# Others
is_msys && export MSYS='winsymlinks'

## zsh
export HISTFILE="$ZDOTDIR/.zsh_history"
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export {HISTSIZE,SAVEHIST,HISTFILESIZE}=100

vital unset
