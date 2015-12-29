has() { type $1 >/dev/null 2>&1; }

[ `uname` != Darwin ] && eval `dircolors -b ~/.dir_colors`

stty stop undef

# Display user info
COLOR="\033[1;38;05;75m"
COLOR_RESET="\033[0;39m"
## Username
printf "${COLOR}Username: ${COLOR_RESET}%s   " $USER
## Shell
printf "${COLOR}Shell: ${COLOR_RESET}"
if [ "$OSTYPE" != "cygwin" ]; then
  ps -p $$ -o comm=
else
  CURRENT_SHELL_PATH=`readlink /proc/$$/exe`
  echo "`basename $CURRENT_SHELL_PATH`"
fi
## LastLogin
if [ "$OSTYPE" != "cygwin" ]; then
  if has lastlog; then
    LASTLOG=`lastlog -u $USER | sed '1d'`
    printf "${COLOR}LastLogin: ${COLOR_RESET}"
    echo $LASTLOG | grep -o 'Never logged in'
    PORT=`echo $LASTLOG | awk '{print $2}'`
    ATTRIBUTE=`echo $LASTLOG | wc -w`
    if [ "$ATTRIBUTE" = "9" ]; then
      FROM=`echo $LASTLOG | awk '{print $3}'`
      DATE=`echo $LASTLOG | awk '{print $4,$5,$6,$7,$9}'`
      echo "$DATE on $PORT from $FROM"
    elif [ "$ATTRIBUTE" = "8" ]; then
      DATE=`echo $LASTLOG | awk '{print $3,$4,$5,$6,$8}'`
      echo "$DATE on $PORT"
    fi
  fi
fi

if [ "$OSTYPE" != "cygwin" ]; then
  # Load keychain
  if has keychain; then
    keychain --nogui --quiet
    [ -f ~/.keychain/$HOST-sh ] && source ~/.keychain/$HOST-sh
  fi
  # Load tmux
  if has tmux; then
    [ -e "${HOME}/.tmux/init.bash" ] && source "${HOME}/.tmux/init.bash"
    #if not inside a tmux session, and if no session is started, start a new session
    if [ -z "$TMUX" ];then
      tmux attach -d >/dev/null 2>&1 || tmux new-session >/dev/null 2>&1
    fi
  fi
fi

unset -f has
