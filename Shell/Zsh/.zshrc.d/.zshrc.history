HISTFILE=~/.zsh_history # historyファイル
HISTFILESIZE=1000000
HISTSIZE=1000000 # ファイルサイズ
SAVEHIST=1000000 # saveする量
setopt hist_ignore_dups # 重複を記録しない
setopt hist_reduce_blanks # スペース排除
setopt share_history # 履歴ファイルを共有
setopt EXTENDED_HISTORY # zshの開始終了を記録
# 操作?
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
