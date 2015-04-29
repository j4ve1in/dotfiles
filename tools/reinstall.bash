#!/bin/bash

printf "Are you sure you want to continue (yes/no)? "
read ANSWER

case $ANSWER in
  "Y" | "y" | "Yes" | "yes" )
    # Uninstall
    export ASSUME_YES="1"
    source ~/.dotfiles/tools/uninstall.bash
    # Install
    printf "Downloading installer..."
    if [ $(which curl) ]; then
      { sleep 1; curl -o ~/j4ve1in_dotfiles_install.bash -L dot.j4ve1in.com; } | env LESS="-cE" less
      elif [ $(which wget) ]; then
        { sleep 1; wget -O ~/j4ve1in_dotfiles_install.bash dot.j4ve1in.com; } | env LESS="-cE" less
        fi
        echo -e "\033[1;36mdone\033[0;39m"
        export ASSUME_YES="1"
        if [ $OSTYPE = cygwin ]; then
          exec source ~/j4ve1in_dotfiles_install.bash
        else
          source ~/j4ve1in_dotfiles_install.bash
        fi
        rm -f ~/j4ve1in_dotfiles_install.bash
        echo -e "Reinstalled\n"
        ;;
      * )
        ;;
    esac

    exit 0
