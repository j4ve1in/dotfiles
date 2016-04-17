#!/bin/bash

. ~/.dotfiles/tools/lib/base.bash
source_lib dot

cprint "Create symbolic link" $UNDERLINE

# Create
[ "$OSTYPE" = "msys" ] && export MSYS='winsymlinks'
COUNT=0
N=${#DOT_NAME[@]}
for ((i=0;i<N;i++)); do
  if [ "${DOT_FILE_TYPE[$i]}" = "File" ]; then
    cprintf " [" $BLUE
    printf "%2d/%2d" $((COUNT+1)) $N
    cprintf "] " $BLUE
    cprintf "Creating symlink:" $COLOR_75_B
    printf " %s\n" ~/${DOT_NAME[$i]}
    ln -fs ${DOT_PATH[$i]} ~/${DOT_NAME[$i]}
    ((COUNT=COUNT+1))
  elif [ "${DOT_FILE_TYPE[$i]}" = "Directory" ]; then
    cprintf " [" $BLUE
    printf "%2d/%2d" $((COUNT+1)) $N
    cprintf "] " $BLUE
    cprintf "Creating symlink:" $COLOR_75_B
    printf " %s\n" ~/${DOT_NAME[$i]}
    ln -fns ${DOT_PATH[$i]} ~/${DOT_NAME[$i]}
    ((COUNT=COUNT+1))
  fi
done

echo
