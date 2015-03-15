#!/bin/bash

printf "Are you sure you want to continue (yes/no)? "
read ANSWER

case $ANSWER in
    "Y" | "y" | "Yes" | "yes" )
        export DOTFILES_REINSTALL="1"
        source ~/.dotfiles/tools/uninstall.bash
        if [ $(which curl) ]; then
            bash -c "$(curl -L https://raw.githubusercontent.com/j4ve1in/dotfiles/master/tools/install.bash)"
        elif [ $(which wget) ]; then
            bash -c "$(wget -O - https://raw.githubusercontent.com/j4ve1in/dotfiles/master/tools/install.bash)"
        fi
        export DOTFILES_REINSTALL=""
        echo -e "Reinstalled\n"
        ;;
    * )
        ;;
esac

exit 0
