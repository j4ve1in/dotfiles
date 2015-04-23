export LANG="ja_JP.UTF-8"
export KCODE="u"
export TERM="xterm-256color"
export EDITOR="vim"
export FCEDIT="vim"
export PAGER="less"
export LESS="-ciMNR"
export SVN_EDITOR="vim"
export WWW_BROWSER="w3m"
export CYGWIN="winsymlinks"
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.dotfiles/bin

# man
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}
