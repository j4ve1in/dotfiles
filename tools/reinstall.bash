#!/bin/bash

printf "Are you sure you want to continue (yes/no)? "
read ANSWER

case $ANSWER in
    "Y" | "y" | "Yes" | "yes" )
        export ASSUME_YES="1"
        source ~/.dotfiles/tools/uninstall.bash
        if [ $(which curl) ]; then
            bash -c "$(curl -L dot.j4ve1in.com)"
        elif [ $(which wget) ]; then
            bash -c "$(wget -O - dot.j4ve1in.com)"
        fi
        export ASSUME_YES=""
        echo -e "Reinstalled\n"
        ;;
    * )
        ;;
esac

exit 0
