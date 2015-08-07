# ls
alias ls='ls -F --color=auto'
alias ll='ls -l'
alias lly='ls -l --time-style=long-iso'
alias la='ls -a'
alias lla='ls -al'

# grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# cd
alias ..='cd ..'
alias ...='cd ~/.dotfiles'

# git
## hub
if which hub >/dev/null 2>&1; then
  eval "`hub alias -s`"
fi

# diff
if which colordiff >/dev/null 2>&1; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

# Vagrant
if which vagrant >/dev/null 2>&1; then
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

# Vim
if which vim >/dev/null 2>&1; then
  alias vi='vim'
  alias tweetvim='vim +TweetVimHomeTimeline'
  alias tweet='vim +TweetVimCommandSay'
  alias agit='vim +Agit'
  alias vf='vim +VimFiler'
  alias ninst='vim +NeoBundleInstall +qall'
  alias nreinst='vim +NeoBundleReinstall +qall'
  alias nup='vim +NeoBundleUpdate +qall'
  alias ncl='vim +NeoBundleClean +qall'
fi

# keychain
if which keychain >/dev/null 2>&1; then
  if [ -f ~/.keychain/$HOST-sh ]; then
    alias keychain='keychain --nogui --quiet >/dev/null 2>&1; source ~/.keychain/$HOST-sh'
  fi
fi

# Others
alias g=git
alias r=rails
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
alias pset='source ~/.proxy/pset'
alias psu='source ~/.proxy/pset'
alias dsetup='dotsetup'
alias dset='dotsetup'
alias dsu='dotsetup'
