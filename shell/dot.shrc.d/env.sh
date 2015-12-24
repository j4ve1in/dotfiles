export LANG="en_US.UTF-8"
export TERM="xterm-256color"
export PAGER="less"
export WWW_BROWSER="w3m"
export VAGRANT_DEFAULT_PROVIDER="virtualbox"

# Ruby
if type ruby >/dev/null 2>&1; then
  export KCODE="u"
  export RUBYGEMS_GEMDEPS=-
fi

# Editor
if type vim >/dev/null 2>&1; then
  export {VISUAL,EDITOR,FCEDIT}="vim"
else
  export {VISUAL,EDITOR,FCEDIT}="vi"
fi

# Less
export LESS="-ciMNR"
LESS_TERMCAP_mb=`echo "\033[1;31m"`
LESS_TERMCAP_md=`echo "\033[1;31m"`
LESS_TERMCAP_me=`echo "\033[0m"`
LESS_TERMCAP_se=`echo "\033[0m"`
LESS_TERMCAP_so=`echo "\033[1;44m"`
LESS_TERMCAP_ue=`echo "\033[0m"`
LESS_TERMCAP_us=`echo "\033[1;36m"`
export LESS_TERMCAP_{mb,md,me,se,so,ue,us}

# Path
[ -d ~/.local/bin ] && PATH+=":$HOME/.local/bin"
[ -d ~/.dotfiles/bin ] && PATH+=":$HOME/.dotfiles/bin"
[ -d /usr/local/heroku ] && PATH+=":/usr/local/heroku/bin"

## Node.js
### Nodebrew
[ -d ~/.nodebrew ] && PATH="$HOME/.nodebrew/current/bin:$PATH"

## Ruby
### rbenv
[ -d ~/.rbenv ] && PATH="$HOME/.rbenv/bin:$PATH"
[ -d ~/.rbenv ] && eval "`rbenv init -`"

## Go
[ -d ~/.local/src/go ] && export GOPATH=$HOME/.local/src/go
[ -n $GOPATH ] && PATH+=":$GOPATH/bin"

export PATH

# Others
case "$(uname -s)" in
  CYGWIN*|MSYS*)
    export CYGWIN="winsymlinks"
    ;;
  Darwin)
    export LSCOLORS="gxfxcxdxbxegedabagacad"
    ;;
esac
