has() { type $1 >/dev/null 2>&1; }

# ls
alias l='ls -F --color=auto' ll='l -hl --time-style=long-iso'
alias la='l -A' lla='ll -A'

# grep
alias gr='grep --color=auto' fgr='fgrep --color=auto' egr='egrep --color=auto'

# cd
alias c='cd'
alias .='l' ..='cd ..' ...='cd ~/.dotfiles'
alias doc='cd ~/Documents' dow='cd ~/Downloads' so='cd ~/Source_code'
alias d='cd ~/Dropbox'

# diff
has colordiff && alias diff='colordiff -u' || alias diff='diff -u'
alias di='diff'

# Vagrant
if has vagrant; then
  alias vah='vagrant halt'
  alias vas='vagrant ssh'
  alias vast='vagrant status' vags='vagrant global-status'
  alias vau='vagrant up' vaus='vagrant up && vagrant ssh'
  alias var='vagrant reload' vars='vagrant reload && vagrant ssh'
fi

# Tmux
if has tmux; then
  alias t='tmux'
  alias ta='tmux attach'
fi

# Vi
if has vim; then
  alias v='vim -p'
  alias twv='vim +TweetVimHomeTimeline'
  alias tw='vim +TweetVimCommandSay'
elif has vi; then
  alias v='vi -p'
fi

# Ruby
if has ruby; then
  alias ru='ruby'
  ## Bundler
  has bundle && alias b='bundle'
  ## Rake
  has rake && alias rk='rake' rkr='rake routes'
  ## Rails
  has rails && alias ri=rails rid='rails db' ric='rails c'
  ## Rails
  has rspec && alias rs='rspec --color'
fi

# mount
alias musb="sudo mount -w -o uid=${USER},iocharset=utf8 /dev/sdb1 /mnt/usb"
alias uusb='sudo umount /mnt/usb'

# Others
has git && alias g='git'
has ghq && alias gh='ghq'
has zsh && alias z='zsh'
has mysql && alias ms='mysql --pager="less -iFMnSX"'
has gyazo && alias gy='gyazo' gym='gyazo_markdown'
alias s='sudo -E '
alias se='sudoedit -E '
alias na='netctl-auto'
alias h='history'
alias p='ps'
alias pw='pwd'
has pacman && alias pm='pacman'
alias m='mv'
alias le='less'
alias path='echo -e ${PATH//:/\\n}'
alias fpath='echo -e ${FPATH//:/\\n}'
alias jman='LANG="ja_JP.UTF-8" man'
alias df='df -h'
alias rm='rm -iv' cp='cp -iv' mv='mv -iv'
alias reload='exec $SHELL -l' rl='reload'
alias dsu='dotsetup'
alias ts='trash'

case "`uname -s`" in
  Linux)
    alias xdo='xdg-open'
    alias xs='xsel'
    alias r='ranger'
    ;;
  MSYS*)
    alias st='start' e='start .'
    ;;
  Darwin)
    alias l='ls -FG'
    alias op='open' f='open .'
    alias pbc='pbcopy' pbp='pbpaste'
    ;;
esac

unset -f has
