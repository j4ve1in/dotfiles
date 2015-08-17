if [ `uname` = Linux ]; then
  if which finger >/dev/null 2>&1; then
    finger -l
  fi
fi

if [ `uname` != Darwin ]; then
  eval `dircolors -b ~/.dir_colors`
fi

stty stop undef

# Load keychain
if [ "$OSTYPE" != "cygwin" ]; then
  if which keychain >/dev/null 2>&1; then
    keychain --nogui --quiet >/dev/null 2>&1
    if [ -f ~/.keychain/$HOST-sh ]; then
      source ~/.keychain/$HOST-sh
    fi
  fi
fi

# Load tmux
if [ "$OSTYPE" != "cygwin" ]; then
  if which tmux >/dev/null 2>&1; then
    #if not inside a tmux session, and if no session is started, start a new session
    if [ -z "$TMUX" ];then
      tmux attach >/dev/null 2>&1 || tmux new-session >/dev/null 2>&1
    fi
  fi
fi
