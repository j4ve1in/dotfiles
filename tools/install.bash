#!/bin/bash

main() {
  set_color
  if [ "$1" != "plugin" ]; then
    : ${FULL_INSTALLATION:=0}
    : ${ASSUME_YES:=0}
    clear
    print_header
    if [ "$ASSUME_YES" = "1" ]; then
      # Assume "yes" as answer to all prompts and run non-interactively.
      install
      unset ASSUME_YES
    else
      echo "   If the file exists, it will be ruthlessly clobbered"
      printf "   Are you sure you want to continue (yes/no)? "; read ANSWER
      echo
      case $ANSWER in
        "Y" | "y" | "Yes" | "yes" )
          install
          ;;
        * )
          ;;
      esac
    fi
  else
    install_plugin; echo
  fi
}

print_header() {
  echo
  printf "$COLOR_32_B"
  echo '          __        __   ____ _  __              '
  echo '     ____/ /____   / /_ / __/(_)/ /___   _____   '
  echo '    / __  // __ \ / __// /_ / // // _ \ / ___/   '
  echo '   / /_/ // /_/ // /_ / __// // //  __/(__  )    '
  echo '   \__,_/ \____/ \__//_/  /_//_/ \___//____/     '
  printf "$COLOR_RESET"; echo
  # http://patorjk.com/software/taag/#p=display&h=1&f=Slant&t=dotfiles

  cprint '                   github.com/j4ve1in/dotfiles   ' "$DARKGRAY"; echo

  cprintf '   Author: '  "$COLOR_75_B"; printf "j4ve1in"
  cprintf '   License: ' "$COLOR_75_B"; echo   "MIT"
  echo
}

install() {
  # Start install
  cprint "Starting install" $UNDERLINE
  if [ "$FULL_INSTALLATION" = "0" ]; then
    printf " Full Installation: "
    cprint "disable" $RED_B
  elif [ "$FULL_INSTALLATION" = "1" ]; then
    printf " Full Installation: "
    cprint "enable" $CYAN_B
  fi
  if [ "$ASSUME_YES" = "0" ]; then
    printf " Option Assume yes: "
    cprint "disable" $RED_B
  elif [ "$ASSUME_YES" = "1" ]; then
    printf " Option Assume yes: "
    cprint "enable" $CYAN_B
  fi
  interval 500000

  ## Check git command
  printf " Checking git command..."
  if has git; then
    cprint "done" $CYAN_B
  else
    cprint "error" $RED_B
    echo " Please install git or update your path to include the git executable"
    exit 1;
  fi
  interval 500000

  ## Download
  printf " Downloading dotfiles..."
  {
    sleep 1
    git clone https://github.com/j4ve1in/dotfiles.git ~/.dotfiles
  } | env LESS="-cE" less
  cprint "done" $CYAN_B
  echo
  interval 500000

  # Backup
  source ~/.dotfiles/tools/backup.bash

  # Deploy
  source ~/.dotfiles/tools/deploy.bash

  # Install plugin
  if [ "$FULL_INSTALLATION" = "1" ]; then
    install_plugin
    unset FULL_INSTALLATION
  fi

  # Restart
  source ~/.dotfiles/tools/restart.bash
}

install_plugin() {
  # Start download plugin manager
  cprint "Starting download plugin manager" $UNDERLINE

  CSV_FILE=~/.dotfiles/tools/data/plugin-manager.csv
  local readonly NAME=($(awk -F ',' '{print $1}' $CSV_FILE | sed '1d;s/"//g'))
  local readonly URL=($(awk -F ',' '{print $2}' $CSV_FILE | sed '1d;s/"//g'))
  local readonly DIR=($(awk -F ',' '{print $3}' $CSV_FILE | sed '1d;s/"//g'))
  local readonly N=${#NAME[@]}

  for ((i=0;i<N;i++)); do
    printf " Downloading ${NAME[i]}..."
    {
      sleep 1
      git clone ${URL[i]} ~/${DIR[i]}
    } | env LESS="-cE" less
    cprint "done" $CYAN_B
    interval 500000
  done
  echo

  # Install plugin
  if has vim && has zsh && has tmux; then
    cprint "Start download plugin by plugin manager" $UNDERLINE
    ## Vim
    if has vim; then
      echo " Vim"
      printf "  Downloading vimproc..."
      {
        sleep 1
        git clone https://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/vimproc.vim
      } | env LESS="-cE" less
      cprint "done" $CYAN_B
      make -C ~/.vim/bundle/vimproc.vim >/dev/null 2>&1
      printf "  Downloading other plugin by NeoBundle..."
      {
        sleep 1
        source ~/.vim/bundle/neobundle.vim/bin/neoinstall
      } | env LESS="-cE" less
      cprint "done" $CYAN_B
      interval 500000
    fi

    ## Zsh
    if has zsh; then
      echo " Zsh"
      printf "  Downloading plugin by Antigen..."
      {
        sleep 1
        zsh ~/.dotfiles/tools/install_zsh_plugin.zsh
      } | env LESS="-cE" less
      cprint "done" $CYAN_B
      interval 500000
    fi

    ## Tmux
    if has tmux && [ -n "$TMUX" ]; then
      echo " Tmux"
      printf "  Downloading plugin by TPM..."
      {
        sleep 1
        bash ~/.tmux/plugins/tpm/bindings/install_plugins
      } | env LESS="-cE" less
      cprint "done" $CYAN_B
      interval 500000
    fi
  fi
}

has() { type $1 >/dev/null 2>&1; }

print() { printf "$@\n"; }

set_color() {
  UNDERLINE="4;39;49"
  RED_B="1;31;49"
  CYAN_B="1;36;49"
  DARKGRAY="90"
  COLOR_32_B="\x1b[1;38;5;32;49m"
  COLOR_75_B="1;38;5;75;49"
  COLOR_RESET="\x1b[0;39;49m"
}

cprint() {
  local string="$1"
  local color="\x1b[${2}m"
  local reset="\x1b[0;39;49m"
  print "${color}${string}${reset}"
}

cprintf() {
  local string="$1"
  local color="\x1b[${2}m"
  local reset="\x1b[0;39;49m"
  printf "${color}${string}${reset}"
}

interval() {
  if has usleep; then
    usleep $1
  fi
}

main $@
