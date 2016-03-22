# Suffix
alias -s sh=sh
alias -s bash=bash
alias -s {md,txt}=cat

## CoffeeScript
if type coffee >/dev/null 2>&1; then
  alias -s coffee=coffee
fi

## Go
if type go >/dev/null 2>&1; then
  alias -s go='go run'
fi

## Nodejs
if type node >/dev/null 2>&1; then
  alias -s js=node
fi

## Python
if type python >/dev/null 2>&1; then
  alias -s py=python
fi

## Ruby
if type ruby >/dev/null 2>&1; then
  alias -s rb=ruby
fi

## Zsh
if type zsh >/dev/null 2>&1; then
  alias -s zsh=zsh
fi

## Vim
if type vim >/dev/null 2>&1; then
  alias -s vim=vim
fi

## C
if type gcc >/dev/null 2>&1; then
  runc() { gcc $1 && shift && ./a.out $@ && rm -f a.out; }
  alias -s c=runc
fi

## Web
if type chromium >/dev/null 2>&1; then
  alias -s {html,css}=chromium
elif type firefox >/dev/null 2>&1; then
  alias -s {html,css}=firefox
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
