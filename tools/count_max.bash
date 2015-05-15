#!/bin/bash
source ~/.dotfiles/tools/create_data.bash
# Count max
MAX=0
MAX_F=0
MAX_D=0
## Dotfile
DOT_MAX=0
DOT_MAX_F=0
DOT_MAX_D=0
N=${#DOT_NAME[@]}
for ((i=0;i<N;i++)); do
  if [ -f ~/${DOT_NAME[$i]} ]; then
    DOT_MAX_F=$((DOT_MAX_F+1))
  fi
  if [ -d ~/${DOT_NAME[$i]} ]; then
    DOT_MAX_D=$((DOT_MAX_D+1))
  fi
  ((DOT_MAX=DOT_MAX_F+DOT_MAX_D))
  MAX=$DOT_MAX
  MAX_F=$DOT_MAX_F
  MAX_D=$DOT_MAX_D
  COLOR="\x1b[34m"
  COLOR_RESET="\x1b[0m"
  printf " Total: %d " $MAX
  printf "${COLOR}(${COLOR_RESET}"
  printf "%d directories, " $MAX_D
  printf "%d files" $MAX_F
  printf "${COLOR})${COLOR_RESET}"
  if [ $OSTYPE = cygwin ]; then
    :
  else
    usleep 10000
  fi
  echo -e "\r\c"
done

## Exdotfile
EXDOT_MAX=0
EXDOT_MAX_F=0
EXDOT_MAX_D=0
N=${#EXDOT_NAME[@]}
for ((i=0;i<N;i++)); do
  if [ -f ~/${EXDOT_NAME[$i]} ]; then
    EXDOT_MAX_F=$((EXDOT_MAX_F+1))
  fi
  if [ -d ~/${EXDOT_NAME[$i]} ]; then
    EXDOT_MAX_D=$((EXDOT_MAX_D+1))
  fi
  ((EXDOT_MAX=EXDOT_MAX_F+EXDOT_MAX_D))
  MAX=$((DOT_MAX+EXDOT_MAX))
  MAX_F=$((DOT_MAX_F+EXDOT_MAX_F))
  MAX_D=$((DOT_MAX_D+EXDOT_MAX_D))
  COLOR="\x1b[34m"
  COLOR_RESET="\x1b[0m"
  printf " Total: %d " $MAX
  printf "${COLOR}(${COLOR_RESET}"
  printf "%d directories, " $MAX_D
  printf "%d files" $MAX_F
  printf "${COLOR})${COLOR_RESET}"
  if [ "$OSTYPE" = "cygwin" ] || [ "$(uname)" = "Darwin" ]; then
    :
  else
    usleep 10000
  fi
  echo -e "\r\c"
done

echo
