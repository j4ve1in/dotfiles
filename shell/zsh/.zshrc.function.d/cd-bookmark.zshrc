if [ -n "$(ls ~/.zsh/function/cd-bookmark)" ]; then
    fpath=($HOME/.zsh/function/cd-bookmark(N-/) $fpath)
    autoload -Uz cd-bookmark
    alias cdb='cd-bookmark'
fi
