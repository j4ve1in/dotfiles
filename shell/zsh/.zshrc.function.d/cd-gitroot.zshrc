if [ -n "$(ls ~/.zsh/function/cd-gitroot)" ]; then
    fpath=($HOME/.zsh/function/cd-gitroot(N-/) $fpath)
    autoload -Uz cd-gitroot
    alias cdu='cd-gitroot'
fi
