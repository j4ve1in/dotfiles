#!/bin/bash

. ~/.dotfiles/tools/lib/base.bash

printf "Are you sure you want to continue (yes/no)? "
read -s -n 1 ANSWER; echo -e '\n'

case $ANSWER in
  "Y" | "y" )
    # Uninstall
    source_dotool uninstall -y

    clear

    # Install
    if has curl; then
      bash (curl -L d.ytet5uy4.com) -y
    elif has wget; then
      bash (wget -O - d.ytet5uy4.com) -y
    fi
    ;;
  * ) exit 0 ;;
esac
