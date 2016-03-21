#!/bin/bash

restart_shell() {
  echo "Restarting shell..."
  if which usleep >/dev/null 2>&1; then
    usleep 500000
  fi
  clear
  exec $SHELL -l
}

restart() {
  printf "Do you want to restart shell (yes/no)? "
  read ANSWER

  case $ANSWER in
    "Y" | "y" | "Yes" | "yes" )
      restart_shell
      ;;
    * )
      echo
      ;;
  esac
}

rm -f ~/install.bash
if [ "$ASSUME_YES" = "1" ]; then
  restart_shell
else
  restart
fi
