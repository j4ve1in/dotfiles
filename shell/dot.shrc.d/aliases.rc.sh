# ls
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
alias m=make
alias mi='make install'
alias mc='make clean'

# cd
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
  alias v='vim'
  alias vi='vim'
  alias tweetvim='vim +TweetVimHomeTimeline'
  alias tweet='vim +TweetVimCommandSay'
  alias agit='vim +Agit'
  alias vf='vim +VimFiler'
  alias ninst='vim +NeoBundleInstall +qall'
  alias nreinst='vim +NeoBundleReinstall +qall'
  alias nup='vim +NeoBundleUpdate +qall'
  alias ncl='vim +NeoBundleClean +qall'
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
alias printpath='echo -e "${PATH//:/\n}"'
alias path='echo -e "${PATH//:/\n}"'
alias jman='env LANG="ja_JP.UTF-8" man'
alias ysh='yum shell'
alias grep='grep --color'
alias df='df -h'
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias mysql='mysql --pager="less -iFMnSX"'
