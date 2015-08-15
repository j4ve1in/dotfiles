#!/bin/bash

main() {
  if [ "$1" = "plugin" ]; then
    install_plugin
  fi
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
        exit 0
        ;;
      * )
        echo
        exit 0
        ;;
    esac
  fi
}

install() {
  # Start install
  echo -e "\033[4;39mStarting install\033[0;39m"
  if [ "$FULL_INSTALLATION" = "0" ]; then
    echo -e " Full Installation: \033[1;31mdisable\033[m"
  elif [ "$FULL_INSTALLATION" = "1" ]; then
    echo -e " Full Installation: \033[1;36menable\033[0;39m"
  fi
  if [ "$ASSUME_YES" = "0" ]; then
    echo -e " Option Assume yes: \033[1;31mdisable\033[m"
  elif [ "$ASSUME_YES" = "1" ]; then
    echo -e " Option Assume yes: \033[1;36menable\033[0;39m"
  fi
  ## Check git command
  printf " Checking git command..."
  if which git >/dev/null 2>&1; then
    echo -e "\033[1;36mdone\033[0;39m"
  else
    echo
    echo " Please install git or update your path to include the git executable"
    exit 1;
  fi

  ## Download
  URL="git://github.com/j4ve1in/dotfiles.git"
  printf " Downloading dotfiles..."
  { sleep 1; git clone $URL ~/.dotfiles --recursive; } | env LESS="-cE" less
  echo -e "\033[1;36mdone\033[0;39m"
  echo

  # Backup
  source ~/.dotfiles/tools/backup.bash

  # Deploy
  if [ $OSTYPE = cygwin ]; then
    export CYGWIN="winsymlinks"
  fi
  source ~/.dotfiles/tools/deploy.bash

  # Install plugin
  if [ "$FULL_INSTALLATION" = "1" ]; then
    install_plugin
    unset FULL_INSTALLATION
  fi

  Color="\033[1;36;44m"
  Color_Reset="\033[0;39m"
  echo -e ${Color}'     ____           __        ____   ______                      __     __      '${Color_Reset}
  echo -e ${Color}'    /  _/___  _____/ /_____ _/ / /  / ____/___  ____ ___  ____  / /__  / /____  '${Color_Reset}
  echo -e ${Color}'    / // __ \/ ___/ __/ __ `/ / /  / /   / __ \/ __ `__ \/ __ \/ / _ \/ __/ _ \ '${Color_Reset}
  echo -e ${Color}'  _/ // / / (__  ) /_/ /_/ / / /  / /___/ /_/ / / / / / / /_/ / /  __/ /_/  __/ '${Color_Reset}
  echo -e ${Color}' /___/_/ /_/____/\__/\__,_/_/_/   \____/\____/_/ /_/ /_/ .___/_/\___/\__/\___/  '${Color_Reset}
  echo -e ${Color}'                                                      /_/                       '${Color_Reset}
  echo -e ${Color}" Follow me at https://github.com/j4ve1in                                        "${Color_Reset}
  echo
  #http://patorjk.com/software/taag/#p=display&f=Slant&t=Install%20Complete
}

install_plugin() {
  # Start download plugin manager
  echo -e "\033[4;39mStarting download plugin manager\033[0;39m"

  CSV_FILE=~/.dotfiles/tools/data/plugin-manager.csv
  declare -a NAME=($(cat $CSV_FILE | cut -d ',' -f 1 | sed -e 's/"//g' -e '1d'))
  declare -a URL=($(cat $CSV_FILE | cut -d ',' -f 2 | sed -e 's/"//g' -e '1d'))
  declare -a DIR=($(cat $CSV_FILE | cut -d ',' -f 3 | sed -e 's/"//g' -e '1d'))
  declare -i N=${#NAME[@]}

  for ((i=0;i<N;i++)); do
    printf " Downloading ${NAME[i]}..."
    { sleep 1; git clone ${URL[i]} ~/${DIR[i]}; } | env LESS="-cE" less
    echo -e "\033[1;36mdone\033[0;39m"
  done

  # Install plugin
  if which vim >/dev/null 2>&1 && which zsh >/dev/null 2>&1 && which tmux >/dev/null 2>&1; then
    echo -e "\033[4;39mStarting download plugin by plugin manager\033[0;39m"
    ## Vim
    if which vim >/dev/null 2>&1; then
      echo " Vim"
      printf "  Downloading vimproc..."
      { sleep 1; git clone git://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/vimproc.vim; } | env LESS="-cE" less
      echo -e "\033[1;36mdone\033[0;39m"
      make -C ~/.vim/bundle/vimproc.vim >/dev/null 2>&1
      printf "  Downloading other plugin..."
      { sleep 1; source ~/.vim/bundle/neobundle.vim/bin/neoinstall; } | env LESS="-cE" less
      echo -e "\033[1;36mdone\033[0;39m"
    fi

    ## Zsh
    if which zsh >/dev/null 2>&1; then
      echo " Zsh"
      printf "  Downloading plugin..."
      { sleep 1; zsh ~/.zshrc.plugin.d/antigen.rc.zsh; } | env LESS="-cE" less
      echo -e "\033[1;36mdone\033[0;39m"
    fi

    ## Tmux
    if which tmux >/dev/null 2>&1; then
      echo " Tmux"
      printf "  Downloading plugin..."
      { sleep 1; bash ~/.tmux/plugins/tpm/scripts/install_plugins.sh; } | env LESS="-cE" less
      echo -e "\033[1;36mdone\033[0;39m"
    fi
  fi
  echo
}

main $@
