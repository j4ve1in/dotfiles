has() { type $1 >/dev/null 2>&1; }

# ls
alias l{,s}='ls -F --color=auto'
alias ll='ls -hl --time-style=long-iso'
alias la='ls -a'
alias lla='ls -ahl --time-style=long-iso'

# grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# cd
alias c='cd'
alias ..='cd ..'
alias ...='cd ~/.dotfiles'
alias doc='cd ~/Documents' dow='cd ~/Downloads' so='cd ~/Source_code'
alias dr='cd ~/Dropbox'

# diff
has colordiff && alias diff='colordiff -u' || alias diff='diff -u'

# Vagrant
if has vagrant; then
  alias vags='vagrant global-status'
  alias vah='vagrant halt'
  alias var='vagrant reload'
  alias vas='vagrant ssh'
  alias vast='vagrant status'
  alias vau='vagrant up'
fi

# Tmux
if has tmux; then
  alias t='tmux'
  alias ta='tmux attach'
fi

# Vi
if has vim; then
  alias v{,i,im}='vim -p'
  alias tweetvim='vim +TweetVimHomeTimeline'
  alias tweet='vim +TweetVimCommandSay'
elif has vi; then
  alias v{,i}='vi -p'
fi

# Ruby
if has ruby; then
  alias ru='ruby'
  ## Bundler
  has bundle && alias b='bundle' be='bundle exec'
  ## Rake
  has rake && alias rk='rake' rkr='rake routes'
  ## Rails
  has rails && alias ri=rails rid='rails db'
  ## Rails
  has rspec && alias rspec='rspec --color'
fi

# Others
has git && alias g='git'
has zsh && alias z='zsh'
has mysql && alias mysql='mysql --pager="less -iFMnSX"'
alias h='history'
alias p='ps'
alias pw='pwd'
alias m='mv'
alias le='less'
alias path='echo -e ${PATH//:/\\n}'
alias jman='LANG="ja_JP.UTF-8" man'
alias df='df -h'
alias rm='rm -iv' cp='cp -iv' mv='mv -iv'
alias reload='exec $SHELL -l'
alias dsu='dotsetup'

case "`uname -s`" in
  Linux)
    alias xdo='xdg-open'
    alias xs='xsel'
    alias r='ranger'
    ;;
  CYGWIN*|MSYS*)
    alias cy='mintty -t Cygwin -i /Cygwin-Terminal.ico -'
    alias cys='cygstart' e='cygstart .'
    ;;
  Darwin)
    alias l{,s}='ls -F'
    alias op='open' f='open .'
    alias pbc='pbcopy' pbp='pbpaste'
    ;;
esac

unset -f has
