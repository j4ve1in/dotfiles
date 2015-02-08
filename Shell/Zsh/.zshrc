# Plugin
source ~/.zshrc.d/plugin/plugin_list.zshrc

# 基本設定
source ~/.zshrc.d/basic.zshrc

# 色
source ~/.zshrc.d/colors.zshrc

# 補完
source ~/.zshrc.d/completion.zshrc

# 履歴
source ~/.zshrc.d/history.zshrc

# alias
source ~/.aliases

# TMUX
source ~/.tmux.autoload

# zstyle
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# グローバルエイリアス
tored() {
    perl -pe 's/^/\e[0;38;5;161m/ && s/$/\e[m/'
}
alias -g E='2> >(tored)'

# zman
# function zman() {
#     PAGER="less -g -s '+/^       "$1"'" man zshall
# }
