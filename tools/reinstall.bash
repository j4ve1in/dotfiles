#!/bin/bash

source ~/.dotfiles/tools/lib/base.bash

printf "Are you sure you want to continue (yes/no)? "; read ANSWER

case $ANSWER in
  "Y" | "y" | "Yes" | "yes" )
    # Uninstall
    export ASSUME_YES="1"
    source ~/.dotfiles/tools/uninstall.bash
    # Install
    printf "Downloading installer..."
    if has curl; then
      {
        sleep 1
        curl -o ~/install.bash -L dot.j4ve1in.com
      } | env LESS="-cE" less
    elif has wget; then
      {
        sleep 1
        wget -O ~/install.bash dot.j4ve1in.com
      } | env LESS="-cE" less
    fi
    cprint "done" $CYAN_B
    export ASSUME_YES="1"
    source ~/install.bash
    ;;
  * )
    ;;
esac
