COLOR="\033[1;38;05;75m"
COLOR_RESET="\033[0;39m"
echo -en "${COLOR}Username: ${COLOR_RESET}"
echo -n "$USER"
echo -n "    "
echo -en "${COLOR}Shell: ${COLOR_RESET}"
if [ `uname` = Linux ] || [ "$OSTYPE" = "cygwin" ]; then
  echo "$(basename $(readlink /proc/$$/exe))"
elif [ `uname` = Darwin ]; then
  echo "$0"
fi
echo -en "${COLOR}LastLogin: ${COLOR_RESET}"
PORT=$(lastlog -u $USER | sed '1d' | awk '{print $2}')
declare -i ATTRIBUTE=$(lastlog -u $USER | sed '1d' | wc -w)
if [ "$ATTRIBUTE" = "9" ]; then
  FROM=$(lastlog -u $USER | sed '1d' | awk '{print $3')
  DATE=$(lastlog -u $USER | sed '1d' | awk '{print $4,$5,$6,$7,$9')
  echo "$DATE on $PORT from $FROM"
elif [ "$ATTRIBUTE" = "8" ]; then
  DATE=$(lastlog -u $USER | sed '1d' | awk '{print $3,$4,$5,$6,$8}')
  echo "$DATE on $PORT"
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
