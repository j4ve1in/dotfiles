#!/bin/bash
#printf "本当に再インストールしますか (yes/no)？ "
printf "Are you sure you want to continue (yes/no)? "
read ANSWER

ANSWER=$(echo $ANSWER | tr y Y | tr -d '[\[\]]')
case $ANSWER in
    ""|Y* )
        export DOTFILES_REINSTALL="1"
        source ~/.dotfiles/Tools/uninstall.bash
        bash -c "$(curl -fsSL https://raw.githubusercontent.com/tetsuya00/Dotfiles/master/Tools/install.bash)"
        echo -e "Reinstalled\n"
        ;;
    *  )
        ;;
esac
