# regular alias
has cp && alias c{,p}='cp -iv'
has mv && alias m{,v}='mv -iv'
has mkdir && alias mkd='mkdir'
has cd && alias -- -='cd -'
has rm && alias rm='rm -iv'
has ls && alias l='ls -F --color=always' ll='l -hl --time-style=long-iso'
has ls && alias la='l -A' lla='ll -A'
has hub && alias g=hub
has nvim && alias n='nvim -p'
has docker && alias d=docker
has docker-compose && alias dc=docker-compose
has yaourt && alias y=yaourt
has sudo && alias sudo='sudo ' s=sudo
has sudoedit && alias sudoedit='sudoedit ' se=sudoedit
has colordiff && alias di='colordiff -u'
has ssh && alias ssh='TERM=xterm-256color ssh'
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
