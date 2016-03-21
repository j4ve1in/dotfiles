has() { type $1 >/dev/null 2>&1; }

export LANG='en_US.UTF-8'
export TERM='xterm-256color'
export PAGER='less'
export WWW_BROWSER='w3m'
export VAGRANT_DEFAULT_PROVIDER='virtualbox'

# Ruby
has ruby && export KCODE='u' RUBYGEMS_GEMDEPS='-'

# Go
has go && [ -d "${HOME}/.local" ] && export GOPATH="${HOME}/.local"

# Editor
has vim && export EDITOR='vim -p' || export EDITOR='vi -p'

# Less
export LESS='-ciMNR'
LESS_TERMCAP_mb=`echo "\033[1;31m"`
LESS_TERMCAP_md=`echo "\033[1;31m"`
LESS_TERMCAP_me=`echo "\033[0m"`
LESS_TERMCAP_se=`echo "\033[0m"`
LESS_TERMCAP_so=`echo "\033[1;44m"`
LESS_TERMCAP_ue=`echo "\033[0m"`
LESS_TERMCAP_us=`echo "\033[1;36m"`
export LESS_TERMCAP_{mb,md,me,se,so,ue,us}

# Path
[ "$OSTYPE" = "cygwin" ] && [ -d "/usr/local/bin" ] && PATH="/usr/local/bin:$PATH"
[ "$OSTYPE" = "msys" ] && [ -d "/usr/local/bin" ] && PATH="/usr/local/bin:$PATH"
[ "$OSTYPE" = "cygwin" ] && [ -d "/usr/bin" ] && PATH="/usr/bin:$PATH"
[ "$OSTYPE" = "msys" ] && [ -d "/usr/bin" ] && PATH="/usr/bin:$PATH"
[ -d "${HOME}/.local/bin" ] && PATH+=":${HOME}/.local/bin"
[ -d "${HOME}/.dotfiles/bin" ] && PATH+=":${HOME}/.dotfiles/bin"
[ -d "${HOME}/.tmux/bin" ] && PATH+=":${HOME}/.tmux/bin"
[ -d "${HOME}/.xmonad/bin" ] && PATH+=":${HOME}/.xmonad/bin"
[ -d '/usr/local/heroku' ] && PATH+=':/usr/local/heroku/bin'

## Anyenv
if [ -d "${HOME}/.anyenv" ] ; then
  PATH="${HOME}/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
  for D in `ls $HOME/.anyenv/envs`; do
    PATH="${HOME}/.anyenv/envs/$D/shims:$PATH"
  done
fi

export PATH

# Others
case "`uname -s`" in
  CYGWIN*) export CYGWIN='winsymlinks' ;;
  MSYS*) export MSYS='winsymlinks';;
  Darwin) export LSCOLORS='gxfxcxdxbxegedabagacad' ;;
esac

unset -f has
