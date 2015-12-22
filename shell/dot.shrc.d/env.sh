export LANG="en_US.UTF-8"
export TERM="xterm-256color"
export PAGER="less"
export WWW_BROWSER="w3m"

# Ruby
if type ruby >/dev/null 2>&1; then
  export KCODE="u"
  export RUBYGEMS_GEMDEPS=-
fi

# VirtualBox
export VAGRANT_DEFAULT_PROVIDER=virtualbox

# Editor
if type vim >/dev/null 2>&1; then
  export VISUAL="vim"
  export EDITOR="vim"
  export FCEDIT="vim"
  export SVN_EDITOR="vim"
else
  export VISUAL="vi"
  export EDITOR="vi"
  export FCEDIT="vi"
  export SVN_EDITOR="vi"
fi

# Less
export LESS="-ciMNR"
export LESS_TERMCAP_mb=`printf "\033[1;31m"`
export LESS_TERMCAP_md=`printf "\033[1;31m"`
export LESS_TERMCAP_me=`printf "\033[0m"`
export LESS_TERMCAP_se=`printf "\033[0m"`
export LESS_TERMCAP_so=`printf "\033[1;44m"`
export LESS_TERMCAP_ue=`printf "\033[0m"`
export LESS_TERMCAP_us=`printf "\033[1;36m"`

# Path
[ -d ~/.local/bin ] && export PATH="$PATH:$HOME/.local/bin"
[ -d ~/.dotfiles/bin ] && export PATH="$PATH:$HOME/.dotfiles/bin"
[ -d /usr/local/heroku ] && export PATH="$PATH:/usr/local/heroku/bin"

## Node.js
### Nodebrew
[ -d ~/.nodebrew ] && export PATH="$HOME/.nodebrew/current/bin:$PATH"

## Ruby
### rbenv
[ -d ~/.rbenv ] && export PATH="$HOME/.rbenv/bin:$PATH"
[ -d ~/.rbenv ] && eval "`rbenv init -`"

## Go
[ -d ~/.local/src/go ] && export GOPATH=$HOME/.local/src/go
[ -n $GOPATH ] && export PATH=$PATH:$GOPATH/bin

# Others
case "$(uname -s)" in
  CYGWIN*|MSYS*)
    export CYGWIN="winsymlinks"
    ;;
  Darwin)
    export LSCOLORS="gxfxcxdxbxegedabagacad"
    ;;
esac
