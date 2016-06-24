has() { type $1 >/dev/null 2>&1; }

# ls
alias l{,s}='ls -F --color=always' ll='l -hl --time-style=long-iso'
alias la='l -A' lla='ll -A'

# grep
alias gr='grep --color=auto' fgr='fgrep --color=auto' egr='egrep --color=auto'

# cd
alias c='cd'
alias ..='cd ..' doc='cd ~/Documents' dow='cd ~/Downloads' so='cd ~/Source_code'

# diff
has colordiff && alias di='colordiff -u' || alias di='diff -u'

# Vagrant
if has vagrant; then
  alias vah='vagrant halt'
  alias vas='vagrant ssh'
  alias vau='vagrant up' vaus='vagrant up && vagrant ssh'
  alias var='vagrant reload' vars='vagrant reload && vagrant ssh'
fi

# Vi
has vi && alias v='vi -p'
has vim && alias v='vim -p' tw="vim +'Unite tweetvim'"

# mount
alias musb="sudo mount -w -o uid=${USER},iocharset=utf8 /dev/sdb1 /mnt/usb"
alias uusb='sudo umount /mnt/usb'

# Others
has git && alias g='git'
has tmux && alias t='tmux'
has mysql && alias ms='mysql --pager="less -iFMnSX"'
has docker && alias d='docker'
has pacman && alias pm='pacman'
has yaourt && alias y='yaourt'
has feednix && alias fn='feednix'
has netctl-auto && alias n='netctl-auto'
has thefuck && eval "`thefuck --alias`"
has hub && eval "`hub alias -s`"
alias s='sudo -E ' se='sudoedit -E '
alias p='ps aux'
alias m='mv'
alias le='less'
alias path='echo -e ${PATH//:/\\n}' fpath='echo -e ${FPATH//:/\\n}'
alias jman="LANG='ja_JP.UTF-8' man"
alias df='df -h'
alias rm='rm -iv' cp='cp -iv' mv='mv -iv'
alias reload='exec $SHELL -l' rl='reload'
alias al='alias | less'
alias dsu='dotsetup'
alias ts='trash'

case "`uname -s`" in
  Linux) alias f='ranger' ;;
  MSYS*) alias st='start' f='start .' ;;
  Darwin) alias l{,s}='ls -FG' ll='l -hl' op='open' f='open .' ;;
esac

unset -f has
