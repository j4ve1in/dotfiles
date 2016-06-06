has() { type $1 >/dev/null 2>&1; }
  
if [ "$OSTYPE" != "msys" ]; then
  cprintf() { printf "\e[${2}m${1}\e[0;39;49m"; }
  SHELL=`ps -p $$ -o comm=`
  # Display LastLogin
  if has lastlog; then
    cprintf 'LastLogin: ' "1;38;05;75" # cyan
    LASTLOG=`last -R | sed -n 2p`
    [ "$SHELL" = "bash" ] && set -- ${LASTLOG}
    [ "$SHELL" = "zsh" ] && set -- "${=LASTLOG}"
    PORT="$2" DATE="$3 $4 $5 $6"
    echo "$DATE on $PORT"
  fi

  # Check for updates
  git fetch >/dev/null 2>&1
  LOCAL=$(git -C ~/.dotfiles log HEAD)
  REMOTE=$(git -C ~/.dotfiles log origin/HEAD)
  cprintf 'Dotfiles version: ' "1;38;05;75" # cyan
  if [ "$LOCAL" = "$REMOTE" ]; then
    echo 'up to date'
  else
    echo 'local out of date'
    printf ' Would you like to update (yes/no)? '
    if [ "$SHELL" = "zsh" ]; then
      read -q ANSWER
      echo
      [[ "$ANSWER" =~ Y\|y ]] && echo && dotsetup -u
    elif [ "$SHELL" = "bash" ]; then
      read -s -n 1 ANSWER
      echo
      [[ "$ANSWER" =~ (Y|y) ]] && echo && dotsetup -u
    fi
  fi
fi

# Load keychain
if has keychain; then
  keychain --nogui --quiet
  [ -f ~/.keychain/$HOST-sh ] && source ~/.keychain/$HOST-sh
fi
