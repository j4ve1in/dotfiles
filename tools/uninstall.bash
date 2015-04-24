#!/bin/bash
source ~/.dotfiles/tools/load_list.bash

uninstall() {
    # Start uninstall
    echo -e "\033[4;39mStarting uninstall\033[0;39m"
    # Remove symlink
    echo "Removing any symbolic link"
    ## Count max
    max=0
    for dotpath in ${DOT_PATH_LIST[@]}; do
        filename=$(find ~/.dotfiles/${dotpath} -maxdepth 1 -name ".*")
        for file in ${filename[@]}; do
            if [ -e ~/${file##*/} ]; then
                max=$(expr ${max} + 1)
            fi
        done
    done

    ## Remove
    count=0
    for dotpath in ${DOT_PATH_LIST[@]}; do
        filename=$(find ~/.dotfiles/${dotpath} -maxdepth 1 -name ".*")
        for file in ${filename[@]}; do
            if [ -e ~/${file##*/} ]; then
                count=$(expr ${count} + 1)
                printf "[%2d/%2d] Removing: %-35s | type: %s\n" ${count} ${max} ~/${file##*/} ${dotpath}
                rm -rf ~/${file##*/}
            fi
        done
    done

    # Remove exception dotfiles
    echo "Removing any file and directory"

    ## Count max
    max=0
    for file in ${EX_DOTFILE_LIST[@]}; do
        if [ -e ~/${file} ]; then
            max=$(expr ${max} + 1)
        fi
    done

    ## Remove
    count=0
    for file in ${EX_DOTFILE_LIST[@]}; do
        if [ -e ~/${file} ]; then
            count=$(expr ${count} + 1)
            printf "[%2d/%2d] Removing: %-35s | type: exdotfile\n" ${count} ${max} ~/${file}
            rm -rf ~/${file}
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
