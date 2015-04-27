if [ -f ~/.zsh/bundle/antigen/antigen.zsh ]; then
    ADOTDIR=$HOME/.zsh/bundle
    source ~/.zsh/bundle/antigen/antigen.zsh
    # Plugin
    antigen bundle b4b4r07/enhancd
    antigen bundle zsh-users/zaw
    antigen bundle Tarrasch/zsh-bd
    # Function
    antigen bundle mollifier/cd-bookmark
    antigen bundle mollifier/cd-gitroot
    antigen bundle zsh-users/zsh-completions src
    antigen apply
fi
