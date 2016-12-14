alias -- -='cd -'
has git && alias g='git'
has nvim && alias v='nvim -p'
has docker && alias d='docker'
has docker-compose && alias dc='docker-compose'
has pacman && alias p='pacman'
has yaourt && alias y='yaourt'
has thefuck && eval "`thefuck --alias`"
has hub && eval "`hub alias -s`"
has ranger && disable r && alias f='ranger' r='rifle'
has sudo && alias sudo='sudo ' s='sudo'
has sudoedit && alias sudoedit='sudoedit ' se='sudoedit'
is-linux && alias l{,s}='ls -F --color=always' ll='l -hl --time-style=long-iso'
is-darwin && alias l{,s}='ls -FG' ll='l -hl'
has colordiff && alias di='colordiff -u' || alias di='diff -u'
has screenfetch && alias info='screenfetch -c 27,255'
has inxi && alias info-full='inxi -Fz'
alias la='l -A' lla='ll -A'
if ! is-alpine; then
  alias grep='grep --color=auto' fgrep='fgrep --color=auto' egrep='egrep --color=auto'
fi
alias le='less'
alias m='mv'
alias rm='rm -iv' cp='cp -iv' mv='mv -iv'

# Suffix alias
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
has gcc && alias -s c=runc
has xdg-oepn && alias -s {gif,jpg,jpeg,png,bmp}=xdg-open
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract
