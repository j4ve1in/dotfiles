# regular alias
has cp && alias c=cp
has mv && alias m=mv
has mkdir && alias mkd=mkdir
has cd && alias -- -='cd -'
has ls && alias l=ls la='l -A' ll='l -l' lla='ll -A'
has hub && alias g=hub
has nvim && alias n=nvim
has docker && alias d=docker
has docker-compose && alias dc=docker-compose
has pacaur && alias p=pacaur
has sudo && alias s='sudo '
has sudoedit && alias se=sudoedit
has gomi && alias gm=gomi

# Suffix alias
alias -s sh=sh bash=bash
alias -s {md,txt}=cat
has chromium && alias -s {html,css}=chromium
has go && alias -s go='go run'
has node && alias -s js=node
has python && alias -s py=python
has ruby && alias -s rb=ruby
has zsh && alias -s zsh=zsh
has nvim && alias -s vim=nvim
has xdg-oepn && alias -s {gif,jpg,jpeg,png,bmp}=xdg-open
has aunpack && alias -s {gz,tgz,zip,tar,rar,7z}=aunpack
