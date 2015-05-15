#!/bin/bash
source ~/.dotfiles/tools/create_data.bash

echo -e "\033[4;39mStart creating symbolic link\033[0;39m"

# Create
COUNT=0
N=${#DOT_NAME[@]}
for ((i=0;i<N;i++)); do
  COLOR="\x1b[34m"
  COLOR_RESET="\x1b[0m"
  if [ "${DOT_FILE_TYPE[$i]}" = "File" ]; then
    printf " "
    printf "${COLOR}[${COLOR_RESET}"
    printf "%2d/%2d" $((COUNT+1)) $N
    printf "${COLOR}]${COLOR_RESET}"
    printf " "
    printf "Creating symlink: %s\n" ~/${DOT_NAME[$i]}
    ln -fs ${DOT_PATH[$i]} ~/${DOT_NAME[$i]}
    ((COUNT=COUNT+1))
  elif [ "${DOT_FILE_TYPE[$i]}" = "Directory" ]; then
    printf " "
    printf "${COLOR}[${COLOR_RESET}"
    printf "%2d/%2d" $((COUNT+1)) $N
    printf "${COLOR}]${COLOR_RESET}"
    printf " "
    printf "Creating symlink: %s\n" ~/${DOT_NAME[$i]}
    ln -fns ${DOT_PATH[$i]} ~/${DOT_NAME[$i]}
    ((COUNT=COUNT+1))
  fi
done

echo
