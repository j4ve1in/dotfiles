#!/bin/bash

main() {
  UNDERLINE="\x1b[4;39m"
  RED="\x1b[1;31m"
  CYAN="\x1b[1;36m"
  SKYBLUE="\033[1;36;44m"
  if [ "$1" != "plugin" ]; then
    : ${FULL_INSTALLATION:=0}
    : ${ASSUME_YES:=0}
    if [ "$ASSUME_YES" = "1" ]; then
      # Assume "yes" as answer to all prompts and run non-interactively.
      # Install
      install
      # Restart
      source ~/.dotfiles/tools/restart.bash
      unset ASSUME_YES
    else
      clear
      echo "If the file exists, it will be ruthlessly clobbered"
      printf "Are you sure you want to continue (yes/no)? "
      read ANSWER
      case $ANSWER in
        "Y" | "y" | "Yes" | "yes" )
          # Install
          install
          # Restart
          source ~/.dotfiles/tools/restart.bash
          ;;
        * )
          echo
          ;;
      esac
    fi
  else
    install_plugin
  fi
}

install() {
  # Start install
  cprint $UNDERLINE "Starting install"
  if [ "$FULL_INSTALLATION" = "0" ]; then
    printf " Full Installation: "
    cprint $RED "disable"
  elif [ "$FULL_INSTALLATION" = "1" ]; then
    printf " Full Installation: "
    cprint $CYAN "enable"
  fi
  if [ "$ASSUME_YES" = "0" ]; then
    printf " Option Assume yes: "
    cprint $RED "disable"
  elif [ "$ASSUME_YES" = "1" ]; then
    printf " Option Assume yes: "
    cprint $CYAN "enable"
  fi
  interval

  ## Check git command
  printf " Checking git command..."
  if type git >/dev/null 2>&1; then
    cprint $CYAN "done"
  else
    cprint $RED "error"
    echo " Please install git or update your path to include the git executable"
    exit 1;
  fi
  interval

  ## Download
  printf " Downloading dotfiles..."
  {
    sleep 1
    git clone git://github.com/j4ve1in/dotfiles.git ~/.dotfiles --recursive
  } | env LESS="-cE" less
  cprint $CYAN "done"
  echo
  interval

  # Backup
  source ~/.dotfiles/tools/backup.bash

  # Deploy
  source ~/.dotfiles/tools/deploy.bash

  # Install plugin
  if [ "$FULL_INSTALLATION" = "1" ]; then
    install_plugin
    unset FULL_INSTALLATION
  fi

  # Display "Install Complete"
  cprint $SKYBLUE '     ____           __        ____   ______                      __     __      '
  cprint $SKYBLUE '    /  _/___  _____/ /_____ _/ / /  / ____/___  ____ ___  ____  / /__  / /____  '
  cprint $SKYBLUE '    / // __ \/ ___/ __/ __ `/ / /  / /   / __ \/ __ `__ \/ __ \/ / _ \/ __/ _ \ '
  cprint $SKYBLUE '  _/ // / / (__  ) /_/ /_/ / / /  / /___/ /_/ / / / / / / /_/ / /  __/ /_/  __/ '
  cprint $SKYBLUE ' /___/_/ /_/____/\__/\__,_/_/_/   \____/\____/_/ /_/ /_/ .___/_/\___/\__/\___/  '
  cprint $SKYBLUE '                                                      /_/                       '
  cprint $SKYBLUE ' Follow me at https://github.com/j4ve1in                                        '
  echo
  #http://patorjk.com/software/taag/#p=display&f=Slant&t=Install%20Complete
}

install_plugin() {
  # Start download plugin manager
  cprint $UNDERLINE "Starting download plugin manager"

  CSV_FILE=~/.dotfiles/tools/data/plugin-manager.csv
  local readonly NAME=($(cat $CSV_FILE | cut -d ',' -f 1 | sed -e 's/"//g' -e '1d'))
  local readonly URL=($(cat $CSV_FILE | cut -d ',' -f 2 | sed -e 's/"//g' -e '1d'))
  local readonly DIR=($(cat $CSV_FILE | cut -d ',' -f 3 | sed -e 's/"//g' -e '1d'))
  local readonly N=${#NAME[@]}

  for ((i=0;i<N;i++)); do
    printf " Downloading ${NAME[i]}..."
    {
      sleep 1
      git clone ${URL[i]} ~/${DIR[i]}
    } | env LESS="-cE" less
    cprint $CYAN "done"
    interval
  done
  echo

  # Install plugin
  if type vim >/dev/null 2>&1 && type zsh >/dev/null 2>&1 && type tmux >/dev/null 2>&1; then
    cprint $UNDERLINE "Starting download plugin by plugin manager"
    ## Vim
    if type vim >/dev/null 2>&1; then
      echo " Vim"
      printf "  Downloading vimproc..."
      {
        sleep 1
        git clone git://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/vimproc.vim
      } | env LESS="-cE" less
      cprint $CYAN "done"
      make -C ~/.vim/bundle/vimproc.vim >/dev/null 2>&1
      printf "  Downloading other plugin..."
      {
        sleep 1
        source ~/.vim/bundle/neobundle.vim/bin/neoinstall
      } | env LESS="-cE" less
      cprint $CYAN "done"
      interval
    fi

    ## Zsh
    if type zsh >/dev/null 2>&1; then
      echo " Zsh"
      printf "  Downloading plugin..."
      {
        sleep 1
        zsh ~/.zshrc.plugin.d/antigen.rc.zsh
      } | env LESS="-cE" less
      cprint $CYAN "done"
      interval
    fi

    ## Tmux
    if type tmux >/dev/null 2>&1; then
      echo " Tmux"
      printf "  Downloading plugin..."
      {
        sleep 1
        bash ~/.tmux/plugins/tpm/scripts/install_plugins.sh
      } | env LESS="-cE" less
      cprint $CYAN "done"
      interval
    fi
  fi
  echo
}

print() {
  printf "$@\n"
}

cprint() {
  local color="$1"
  local string="$2"
  local reset="\x1b[0m"
  print "${color}${string}${reset}"
}

cprintf() {
  local color="$1"
  local string="$2"
  local reset="\x1b[0m"
  printf "${color}${string}${reset}"
}

interval() {
  if which usleep >/dev/null 2>&1; then
    usleep 500000
  fi
}

main $@
