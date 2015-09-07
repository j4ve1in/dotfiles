# ls
alias l='ls -F --color=auto'
alias ls='ls -F --color=auto'
alias ll='ls -hl'
alias lly='ls -hl --time-style=long-iso'
alias la='ls -a'
alias lla='ls -ahl'

# grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# make
alias mi='make install'
alias mc='make clean'

# cd
alias c='cd'
alias ..='cd ..'
alias ...='cd ~/.dotfiles'

# git
## hub
if type hub >/dev/null 2>&1; then
  eval "`hub alias -s`"
fi

# diff
if type colordiff >/dev/null 2>&1; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

# Ansible
if type ansible >/dev/null 2>&1; then
  an='ansible'
  anp='ansible-playbook'
fi

# Pset
alias pset='source ~/.proxy/pset'
alias psu='source ~/.proxy/pset'

# Dotsetup
alias dsetup='dotsetup'
alias dset='dotsetup'
alias dsu='dotsetup'

# Vagrant
if type vagrant >/dev/null 2>&1; then
  alias vags='vagrant global-status'
  alias vai='vagrant init'
  alias vah='vagrant halt'
  alias vap='vagrant package'
  alias varl='vagrant reload'
  alias vars='vagrant resume'
  alias vass='vagrant ssh'
  alias vast='vagrant status'
  alias vasu='vagrant suspend'
  alias vau='vagrant up'
fi

# Tmux
if type tmux >/dev/null 2>&1; then
  alias t='tmux'
  alias ta='tmux attach'
  alias tat='tmux attach -t 0'
  alias tls='tmux list-session'
  alias tlc='tmux list-clients'
fi

# Vim
if type vim >/dev/null 2>&1; then
  alias v='vim -p'
  alias vi='vim -p'
  alias tweetvim='vim +TweetVimHomeTimeline'
  alias tweet='vim +TweetVimCommandSay'
  alias vimfiler='vim +VimFiler'
else
  alias v='vi'
fi

# Ruby
if type ruby >/dev/null 2>&1; then
  alias ru=ruby
  ## Bundler
  if type bundle >/dev/null 2>&1; then
    alias b=bundle
    alias be='bundle exec'
  fi
  ## Rake
  if type rake >/dev/null 2>&1; then
    alias rr='rake routes'
    alias rd='rake db'
    alias rdc='rake db:create'
    alias rdm='rake db:migrate'
    alias rds='rake db:seed'
  fi
  ## Rails
  if type rails >/dev/null 2>&1; then
    alias ra=rails
    alias ran='rails new'
    alias rag='rails generate'
    alias ras='rails server -b 0.0.0.0'
  fi
fi

# keychain
if type keychain >/dev/null 2>&1; then
  if [ -f ~/.keychain/$HOST-sh ]; then
    alias keychain='keychain --nogui --quiet >/dev/null 2>&1; source ~/.keychain/$HOST-sh'
  fi
fi

# Others
alias g=git
alias h=history
alias p=ps
alias pw=pwd
alias z=zsh
alias r=rm
alias m=mv
alias le=less
alias path='echo -e "${PATH//:/\n}"'
alias jman='env LANG="ja_JP.UTF-8" man'
alias grep='grep --color'
alias df='df -h'
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias mysql='mysql --pager="less -iFMnSX"'
alias reload='exec $SHELL -l'

## Linux
if [ `uname` = Linux ]; then
  alias xdo='xdg-open'
  alias xrr='xrandr'

  # Browse
  alias google='xdg-open https://www.google.co.jp/'
  alias github='xdg-open https://github.com/'
  alias wikipedia='xdg-open http://ja.wikipedia.org/'

  # Clipboard
  alias xs='xsel'
  alias xc='xclip'

  # Gnome
  alias gnb='gnome-boxes'
  alias gncl='gnome-clocks'
  alias gnca='gnome-calculator'
  alias gncc='gnome-control-center'
  alias gnd='gnome-disks'
  alias gnf='gnome-font-viewer'
  alias gnh='gnome-help'
  alias gns='gnome-software'
  alias gnsm='gnome-system-monitor'
  alias gntt='gnome-tweak-tool'
  alias gnwp='gnome-web-photo'

  # dnf
  if type dnf >/dev/null 2>&1; then
    alias dn=dnf
    alias dni='dnf install -y'
    alias dnu='dnf update -y'
    alias sdn='sudo dnf'
    alias sdni='sudo dnf install -y'
    alias sdnu='sudo dnf update -y'
  fi

  # Screenshot
  ## import
  alias imp='import'

  ## xwd
  alias xwd='xwd | convert - screenshot.png; rm screenshot.xwd'

  ## Gnome-screenshot
  alias gns='gnome-screenshot'
  alias gnsa='gnome-screenshot --area'
  alias gnsad='gnome-screenshot --area --delay=3'
  alias gnsw='gnome-screenshot --window'
  alias gnswd='gnome-screenshot --window --delay=3'
  alias gnsd='gnome-screenshot --delay=3'

  ## scrot
  alias scr='scrot'

  # Terminal
  alias gnt='gnome-terminal'
  alias urxvt='urxvt256c-ml'
  alias urxvt-font='set-urxvt-font-size'
fi

## Cygwin
if [ "$OSTYPE" = "cygwin" ]; then
  alias cy='mintty -t Cygwin -i /Cygwin-Terminal.ico -'
  alias cyc='cygcheck'
  alias cyp='cygpath'
  alias cys='cygstart'
  alias rcy='exec cygstart mintty -t "Cygwin" -i /Cygwin-Terminal.ico -'

  alias e='cygstart .'
  alias explorer='cygstart .'

  # PowerShell
  alias powershell='cygstart powershell'
  alias pwsh='cygstart pwsh'

  # Browse
  alias google='cygstart https://www.google.co.jp/'
  alias github='cygstart https://github.com/'
  alias wikipedia='cygstart http://ja.wikipedia.org/'
fi

## OSX
if [ `uname` = Darwin ]; then
  alias l='ls -F'
  alias ls='ls -F'
  alias op='open'
  alias f='open .'
  alias finder='open .'
  alias pbc='pbcopy'
  alias pbp='pbpaste'

  # Browse
  alias google='open https://www.google.co.jp/'
  alias github='open https://github.com/'
  alias wikipedia='open http://ja.wikipedia.org/'
fi
