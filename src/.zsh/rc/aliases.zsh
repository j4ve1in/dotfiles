has() { type $1 >/dev/null 2>&1; }
is_gnu() { [[ "$OSTYPE" =~ (linux|msys) ]]; }
is_bsd() { [[ "$OSTYPE" =~ darwin ]]; }

# ls
is_gnu && alias l{,s}='ls -F --color=always' ll='l -hl --time-style=long-iso'
is_bsd && alias l{,s}='ls -FG' ll='l -hl'
alias la='l -A' lla='ll -A'

# grep
alias gr='grep --color=auto' fgr='fgrep --color=auto' egr='egrep --color=auto'

# cd
alias c='cd'
alias doc='cd ~/Documents' dow='cd ~/Downloads' so='cd ~/Source_code'

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
has vim && alias v='vim -p'

# mount
alias musb="sudo mount -w -o uid=${USER},iocharset=utf8 /dev/sdb1 /mnt/usb"
alias uusb='sudo umount /mnt/usb'

# Others
has history && alias h='history'
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
has ranger && alias f='ranger'
has start && alias st='start' f='start .'
has sudo && alias s='sudo -E '
has sudoedit && se='sudoedit -E '
has open && op='open' f='open .'
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

# Suffix
alias -s sh=sh bash=bash
alias -s {md,txt}=cat
has chromium && alias -s {html,css}=chromium

has coffee && alias -s coffee=coffee
has go && alias -s go='go run'
has node && alias -s js=node
has python && alias -s py=python
has ruby && alias -s rb=ruby
has zsh && alias -s zsh=zsh
has vim && alias -s vim=vim

## C
if has gcc; then
  runc() { gcc $1 && shift && ./a.out $@ && rm -f a.out; }
  alias -s c=runc
fi

## Image
if [ $(uname) = Linux ]; then
  alias -s {gif,jpg,jpeg,png,bmp}=xdg-open
elif [ "$OSTYPE" = "msys" ]; then
  alias -s {gif,jpg,jpeg,png,bmp}=start
elif [ $(uname) = Darwin ]; then
  alias -s {gif,jpg,jpeg,png,bmp}=open
fi

## Extract
extract() {
  case $1 in
    *.tar.gz|*.tgz) tar xzvf $1;;
    *.tar.xz) tar Jxvf $1;;
    *.zip) unzip $1;;
    *.lzh) lha e $1;;
    *.tar.bz2|*.tbz) tar xjvf $1;;
    *.tar.Z) tar zxvf $1;;
    *.gz) gzip -d $1;;
    *.bz2) bzip2 -dc $1;;
    *.Z) uncompress $1;;
    *.tar) tar xvf $1;;
    *.arj) unarj $1;;
  esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract

unset -f has
