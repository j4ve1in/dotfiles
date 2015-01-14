#!/bin/bash
#printf "本当に再インストールしますか (yes/no)？ "
printf "Are you sure you want to continue (yes/no)? "
read ANSWER

ANSWER=$(echo $ANSWER | tr y Y | tr -d '[\[\]]')
case $ANSWER in
    ""|Y* )
        bash ~/.dotfiles/Tools/uninstall.sh -r
        bash ~/.dotfiles/Tools/install.sh -r
        echo -e "Reinstalled\n"
        ;;
    *  )
        ;;
esac
