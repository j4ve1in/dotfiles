# Load ~/.shrc.d/local.rc.sh
RCLOCAL=~/.shrc.d/local.rc.sh
[ -r "$RCLOCAL" ] && [ -f "$RCLOCAL" ] && source "$RCLOCAL"
unset -v RCLOCAL

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
  if type lastlog >/dev/null 2>&1; then
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

# Load keychain
if [ "$OSTYPE" != "cygwin" ]; then
  if type keychain >/dev/null 2>&1; then
    keychain --nogui --quiet
    if [ -f ~/.keychain/$HOST-sh ]; then
      source ~/.keychain/$HOST-sh
    fi
  fi
fi

# Load tmux
if [ "$OSTYPE" != "cygwin" ]; then
  if type tmux >/dev/null 2>&1; then
    #if not inside a tmux session, and if no session is started, start a new session
    if [ -z "$TMUX" ];then
      tmux attach -d >/dev/null 2>&1 || tmux new-session >/dev/null 2>&1
    fi
  fi
fi