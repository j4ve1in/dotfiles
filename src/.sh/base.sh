has() { type $1 >/dev/null 2>&1; }
cprintf() { printf "\e[${2}m${1}\e[0;39;49m"; }

[ `uname` != Darwin ] && eval `dircolors -b ~/.dir_colors`

stty stop undef

# Display LastLogin
if has lastlog; then
  cprintf 'LastLogin: ' "1;38;05;75" # cyan
  LASTLOG=`last -R | sed -n 2p`
  SHELL=`ps -p $$ -o comm=`
  [ "$SHELL" = "bash" ] && set -- ${LASTLOG}
  [ "$SHELL" = "zsh" ] && set -- "${=LASTLOG}"
  PORT="$2" DATE="$3 $4 $5 $6"
  echo "$DATE on $PORT"
fi

# Launch tmux
# if not inside a tmux session, and if no session is started,
# start a new session
if has tmux && [ -z "$TMUX" ]; then
  tmux attach -d >/dev/null 2>&1 || tmux
fi

unset -f has cprintf
