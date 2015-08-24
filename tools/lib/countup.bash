#!/bin/bash

source ~/.dotfiles/tools/lib/base.bash

source_dotool lib/dot

MAX=0
MAX_F=0
MAX_D=0
BLUE="34"
COLOR_75_B="1;38;5;75;49"
N=${#DOT_NAME[@]}
for ((i=0;i<N;i++)); do
  if [ -f ~/${DOT_NAME[$i]} ]; then
    MAX_F=$((MAX_F+1))
  elif [ -d ~/${DOT_NAME[$i]} ]; then
    MAX_D=$((MAX_D+1))
  fi
  ((MAX=MAX_F+MAX_D))
  cprintf " Total:" $COLOR_75_B; printf " %d " $MAX
  cprintf "(" $BLUE
  printf "%d directories, " $MAX_D
  printf "%d files" $MAX_F
  cprintf ")" $BLUE
  interval 10000
  echo -e "\r\c"
done

echo
