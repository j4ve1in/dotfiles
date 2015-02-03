# Source global definitions
if [ "$OSTYPE" = "cygwin" ]; then
    if [ -f /etc/bashrc ]; then
        /etc/bashrc
    fi
fi

# some cygwin related patches
if [ "$OSTYPE" = "cygwin" ]; then
  if [ -x /usr/bin/tput ]; then
    LINES=$(tput lines)
    export LINES
    COLUMNS=$(tput cols)
    export COLUMNS 
  fi
fi

# alias
source ~/.aliases

# viモードでコマンドラインを編集する
set -o vi

# Prompt
source ~/.bashrc.prompt

# TMUX
source ~/.tmux.autoload
