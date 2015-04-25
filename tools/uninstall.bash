#!/bin/bash
source ~/.dotfiles/tools/load_dotpath.bash
source ~/.dotfiles/tools/load_exdotfile.bash

uninstall() {
    # Start uninstall
    echo -e "\033[4;39mStarting uninstall\033[0;39m"

    # Count max
    ## Dotfile
    for file in ${DOTPATH[@]}; do
        if [ -e ~/${file##*/} ]; then
            max=$((max + 1))
        fi
    done

    # Exdotfile
    N=$((${#EXDOTFILE[@]} - 1))
    for i in $(seq 1 $N); do
        if [ -e ~/${EXDOTFILE[$i]} ]; then
            max=$((max + 1))
        fi
    done

    ## Remove
    i=0
    N=$((${#DOTDIR[@]} - 1))
    for j in $(seq 1 $N); do
        DOTPATH=$(find ~/.dotfiles/${DOTDIR[$j]} -maxdepth 1 -name ".*")
        for file in ${DOTPATH[@]}; do
            i=$((i + 1))
            printf "[%2d/%2d] Removing: %-35s | type: %s\n" $i $max ~/${file##*/} ${DOTDIR_A[$j]}
            rm -rf ~/${file##*/}
        done
    done

    # Exdotfile
    N=$((${#EXDOTFILE[@]} - 1))
    for j in $(seq 1 $N); do
        if [ -e ~/${EXDOTFILE[$j]} ]; then
            i=$((i + 1))
            printf "[%2d/%2d] Removing: %-35s | type: exdotfile\n" $i $max ~/$file
            rm -rf ~/$file
        fi
    done

    ## dotfiles
    rm -rf ~/.dotfiles

    echo -e "Uninstalled\n"
}

if [ "$ASSUME_YES" = "1" ]; then
    uninstall
    unset ASSUME_YES
else
    printf "Are you sure you want to continue (yes/no)? "
    read ANSWER

    case $ANSWER in
        "Y" | "y" | "Yes" | "yes" )
            uninstall
            exit 0
            ;;
        * )
            echo
            exit 0
            ;;
    esac
fi
