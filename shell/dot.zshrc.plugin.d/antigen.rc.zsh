ADOTDIR=$HOME/.zsh/bundle
source ~/.zsh/bundle/antigen/antigen.zsh
# Plugin
antigen bundle zsh-users/zaw
antigen bundle Tarrasch/zsh-bd
# Function
antigen bundle mollifier/cd-bookmark
antigen bundle mollifier/cd-gitroot
antigen bundle zsh-users/zsh-completions src
antigen apply
