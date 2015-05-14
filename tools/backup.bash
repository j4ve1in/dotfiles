#!/bin/bash
source ~/.dotfiles/tools/create_data.bash

# Count max
echo -e "\033[4;39mChecking backup file\033[0;39m"
source ~/.dotfiles/tools/count_max.bash

if [ "$MAX" != "0" ]; then
  # Create backup dir
  DATE=$(date +"%Y-%m-%d_%H%M%S")
  printf " Creating backup directory..."
  mkdir -p ~/.dotfiles/backup/$DATE
  echo -e "\033[1;36mdone\033[0;39m"
  # Display backup directory
  echo "  Backup directory: ~/.dotfiles/backup/$DATE"
  echo

  # Start backup
  echo -e "\033[4;39mStarting backup\033[0;39m"
  echo " \`dotfiles' -> \`~/.dotfiles/backup/$DATE'"

  ## Dotfile
  N=${#DOT_NAME[@]}
  for ((i=0;i<N;i++)); do
    COLOR="\x1b[34m"
    COLOR_RESET="\x1b[0m"
    if [ -f ~/${DOT_NAME[$i]} ]; then
      printf " "
      printf "${COLOR}[${COLOR_RESET}"
      printf "%2d/%2d" $((i+1)) $MAX
      printf "${COLOR}]${COLOR_RESET}"
      printf " "
      printf "Copying: %s\n" ~/${DOT_NAME[$i]}
      cp ~/${DOT_NAME[$i]} ~/.dotfiles/backup/$DATE
    elif [ -d ~/${DOT_NAME[$i]} ]; then
      printf " "
      printf "${COLOR}[${COLOR_RESET}"
      printf "%2d/%2d" $((i+1)) $MAX
      printf "${COLOR}]${COLOR_RESET}"
      printf " "
      printf "Copying: %s\n" ~/${DOT_NAME[$i]}
      cp -r ~/${DOT_NAME[$i]}/ ~/.dotfiles/backup/$DATE
      if [ ! -L ~/${DOT_NAME[$i]} -a -d ~/${DOT_NAME[$i]} ]; then
        rm -fr ~/${DOT_NAME[$i]}/
      fi
    fi
  done
  ## Exdotfile
  N=${#EXDOT_NAME[@]}
  for ((j=0;j<N;j++)); do
    COLOR="\x1b[34m"
    COLOR_RESET="\x1b[0m"
    if [ "${EXDOT_FILE_TYPE[$j]}" = "File" ]; then
      printf " "
      printf "${COLOR}[${COLOR_RESET}"
      printf "%2d/%2d" $((i+1)) $MAX
      printf "${COLOR}]${COLOR_RESET}"
      printf " "
      printf "Copying: %s\n" ~/${EXDOT_NAME[$j]}
      cp ~/${EXDOT_NAME[$j]} ~/.dotfiles/backup/$DATE
      ((i=i++))
    elif [ "${EXDOT_FILE_TYPE[$j]}" = "Directory" ]; then
      printf " "
      printf "${COLOR}[${COLOR_RESET}"
      printf "%2d/%2d" $((i+1)) $MAX
      printf "${COLOR}]${COLOR_RESET}"
      printf " "
      printf "Copying: %s\n" ~/${EXDOT_NAME[$j]}
      cp -r ~/${EXDOT_NAME[$j]}/ ~/.dotfiles/backup/$DATE
      if [ ! -L ~/${EXDOT_NAME[$j]} -a -d ~/${EXDOT_NAME[$j]} ]; then
        rm -fr ~/${EXDOT_NAME[$j]}/
      fi
      ((i=i++))
    fi
  done
else
  echo " Backup file doesn't exist"
fi

echo
