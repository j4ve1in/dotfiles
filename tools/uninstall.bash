#!/bin/bash
source ~/.dotfiles/tools/load_list.bash

uninstall() {
    # Start uninstall
    echo "Starting uninstall"
    # Remove symlink
    echo "Removing any symbolic link"
    ## Calc max
    max=0
    for dir_list in ${DIR_LIST[@]}; do
        filename=$(find ~/.dotfiles/${dir_list} -maxdepth 1 -name ".*")
        for file in ${filename[@]}; do
            if [ -e ~/${file##*/} ]; then
                max=$(expr ${max} + 1)
            fi
        done
    done

    ## Remove
    count=0
    for dir_list in ${DIR_LIST[@]}; do
        filename=$(find ~/.dotfiles/${dir_list} -maxdepth 1 -name ".*")
        for file in ${filename[@]}; do
            if [ -e ~/${file##*/} ]; then
                count=$(expr ${count} + 1)
                printf "[%3d/%3d] Removing : %s\n" ${count} ${max} ~/${file##*/}
                rm -rf ~/${file##*/}
            fi
        done
    done

    # Remove exception dotfiles
    echo "Removing any file and directory"

    ## Calc max
    max=0
    for file in ${EXCEPTIONFILE_LIST[@]}; do
        if [ -e ~/${file} ]; then
            max=$(expr ${max} + 1)
        fi
    done

    ## Remove
    count=0
    for file in ${EXCEPTIONFILE_LIST[@]}; do
        if [ -e ~/${file} ]; then
            count=$(expr ${count} + 1)
            printf "[%3d/%3d] Removing : %s\n" ${count} ${max} ~/${file}
            rm -rf ~/${file}
        fi
    done

    ## dotsetup
    rm ~/bin/dotsetup
    if [ -z "$(ls ~/bin)" ]; then
        rm -rf ~/bin
    fi

    ## dotfiles
    rm -rf ~/.dotfiles

    echo -e "Uninstalled\n"
}

if [ "$ASSUME_YES" = "1" ]; then
    uninstall
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
