#!/bin/bash
source ~/.dotfiles/tools/create_data.bash

uninstall() {
  # Count max
  echo -e "\033[4;39mChecking file\033[0;39m"
  source ~/.dotfiles/tools/count_max.bash
  echo

  # Start uninstall
  echo -e "\033[4;39mStarting uninstall\033[0;39m"

  ## Remove
  N=${#DOT_NAME[@]}
  for ((i=0;i<N;i++)); do
    if [ -e ~/${DOT_NAME[$i]} ]; then
      COLOR="\x1b[34m"
      COLOR_RESET="\x1b[0m"
      printf " "
      printf "${COLOR}[${COLOR_RESET}"
      printf "%2d/%2d" $((i+1)) $MAX
      printf "${COLOR}]${COLOR_RESET}"
      printf " "
      printf "Removing: %s\n" ~/${DOT_NAME[$i]}
      rm -rf ~/${DOT_NAME[$i]}
    fi
  done

  ## Exdotfile
  N=${#EXDOT_NAME[@]}
  for ((j=0;j<N;j++)); do
    COLOR="\x1b[34m"
    COLOR_RESET="\x1b[0m"
    if [ -e ~/${EXDOT_NAME[$j]} ]; then
      printf " "
      printf "${COLOR}[${COLOR_RESET}"
      printf "%2d/%2d" $((i+1)) $MAX
      printf "${COLOR}]${COLOR_RESET}"
      printf " "
      printf "Removing: %s\n" ~/${EXDOT_NAME[$j]}
      rm -rf ~/${EXDOT_NAME[$j]}
      ((i=i++))
    fi
  done

  ## dotfiles
  rm -rf ~/.dotfiles

  echo -e "Uninstalled\n"
}

if [ "$ASSUME_YES" = "1" ]; then
  uninstall
  unset ASSUME_YES
else
  printf "Are you sure you want to continue (yes/no)? "
  read ANSWER

  case $ANSWER in
    "Y" | "y" | "Yes" | "yes" )
      uninstall
      exit 0
      ;;
    * )
      echo
      exit 0
      ;;
  esac
fi
