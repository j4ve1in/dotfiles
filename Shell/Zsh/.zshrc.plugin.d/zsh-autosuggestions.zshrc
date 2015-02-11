# Setup zsh-autosuggestions
source ~/.zsh/plugin/zsh-autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically
zle-line-init() {
    zle autosuggest-start
}

zle -N zle-line-init

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
bindkey '^T' autosuggest-toggle
# use ctrl+f to accept a suggested word
bindkey '^D' vi-forward-word
bindkey '^F' vi-add-eol
