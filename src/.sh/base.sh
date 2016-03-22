has() { type $1 >/dev/null 2>&1; }
cprintf() { printf "\x1b[${2}m${1}\x1b[0;39;49m"; }

[ `uname` != Darwin ] && eval `dircolors -b ~/.dir_colors`

stty stop undef

# Display LastLogin
COLOR_75_B="1;38;05;75" # cyan
if [ "$OSTYPE" != "msys" ]; then
  SHELL=`ps -p $$ -o comm=`
  if has lastlog; then
    LASTLOG=`lastlog -u $USER | sed '1d'`
    cprintf 'LastLogin: ' $COLOR_75_B
    echo $LASTLOG | grep -o 'Never logged in'
    ATTRIBUTE=`echo $LASTLOG | wc -w`
    [ "$SHELL" = "bash" ] && set -- ${LASTLOG}
    [ "$SHELL" = "zsh" ] && set -- "${=LASTLOG}"
    PORT="$2"
    if [ "$ATTRIBUTE" = "9" ]; then
      FROM="$3"
      DATE="$4 $5 $6 $7 $9"
      echo "$DATE on $PORT from $FROM"
    elif [ "$ATTRIBUTE" = "8" ]; then
      DATE="$3 $4 $5 $6 $8"
      echo "$DATE on $PORT"
    fi
  fi
fi

# Launch tmux
if [ "$OSTYPE" != "msys" ]; then
  if has tmux; then
    #if not inside a tmux session, and if no session is started, start a new session
    if [ -z "$TMUX" ];then
      tmux attach -d >/dev/null 2>&1 || tmux
    fi
  fi
fi

unset -f has cprintf
