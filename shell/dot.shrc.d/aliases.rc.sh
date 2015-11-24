has() { type $1 >/dev/null 2>&1; }

# ls
alias l='ls -F --color=auto'
alias ls='ls -F --color=auto'
alias ll='ls -hl --time-style=long-iso'
alias la='ls -a'
alias lla='ls -ahl --time-style=long-iso'

# grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# make
if has make; then
  alias mi='make install'
  alias mc='make clean'
fi

# cd
alias c='cd'
alias ..='cd ..'
alias ...='cd ~/.dotfiles'
alias doc='cd ~/Documents'
alias dow='cd ~/Downloads'
alias dr='cd ~/Dropbox'
alias so='cd ~/Source_code'

# diff
if has colordiff; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

# Ansible
if has ansible; then
  an='ansible'
  anp='ansible-playbook'
fi

# Vagrant
if has vagrant; then
  alias vags='vagrant global-status'
  alias vai='vagrant init'
  alias vah='vagrant halt'
  alias vapa='vagrant package'
  alias vapr='vagrant provision'
  alias varl='vagrant reload'
  alias vars='vagrant resume'
  alias vass='vagrant ssh'
  alias vast='vagrant status'
  alias vasu='vagrant suspend'
  alias vau='vagrant up'
fi

# Tmux
if has tmux; then
  alias t='tmux'
  alias ta='tmux attach'
  alias tat='tmux attach -t 0'
  alias tls='tmux list-session'
  alias tlc='tmux list-clients'
fi

# Vim
if has nvim; then
  alias nv='nvim -p'
  alias nvi='nvim -p'
fi
if has vim; then
  alias v='vim -p'
  alias vi='vim -p'
  alias tweetvim='vim +TweetVimHomeTimeline'
  alias tweet='vim +TweetVimCommandSay'
  alias vimfiler='vim +VimFiler'
  alias vrc='vim ~/.vimrc'
  alias virc='vim ~/.vimrc'
  has zsh && alias zenv='vim ~/.zshenv'
  has zsh && alias zrc='vim ~/.zsh/.zshrc'
  has zsh && alias zrcd='vim ~/.zsh/.zshrc.d'
else
  alias v='vi -p'
  alias vrc='vi ~/.vimrc'
  alias virc='vi ~/.vimrc'
fi

# Ruby
if has ruby; then
  alias ru=ruby
  ## Bundler
  if has bundle; then
    alias b=bundle
    alias be='bundle exec'
  fi
  ## Rake
  if has rake; then
    alias rr='rake routes'
    alias rd='rake db'
    alias rdc='rake db:create'
    alias rdm='rake db:migrate'
    alias rds='rake db:seed'
  fi
  ## Rails
  if has rails; then
    alias ra=rails
    alias ran='rails new'
    alias rag='rails generate'
    alias ras='rails server -b 0.0.0.0'
  fi
fi

# Others
has git && alias g=git
has zsh && alias z=zsh
has mysql && alias mysql='mysql --pager="less -iFMnSX"'
alias h=history
alias p=ps
alias pw=pwd
alias r=rm
alias m=mv
alias le=less
alias path='echo -e "${PATH//:/\n}"'
alias user='echo "$USER"'
alias jman='env LANG="ja_JP.UTF-8" man'
alias grep='grep --color'
alias df='df -h'
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias reload='exec $SHELL -l'
alias dsu='dotsetup'

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
  if has; then
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

unset -f has
