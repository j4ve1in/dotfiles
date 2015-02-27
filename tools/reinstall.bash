#!/bin/bash

printf "Are you sure you want to continue (yes/no)? "
read ANSWER

case $ANSWER in
    "Y" | "y" | "Yes" | "yes" )
        export DOTFILES_REINSTALL="1"
        source ~/.dotfiles/tools/uninstall.bash
        bash -c "$(curl -fsSL https://raw.githubusercontent.com/tetsuya00/dotfiles/master/tools/install.bash)"
        export DOTFILES_REINSTALL=""
        echo -e "Reinstalled\n"
        ;;
    * )
        ;;
esac

exit 0