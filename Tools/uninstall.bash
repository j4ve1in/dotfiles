#!/bin/bash
source ~/.dotfiles/Tools/load_list.bash

remove_symlink() {
    # Remove symlink
    echo "Removing any symbolic link"
    ## Calc max
    max=0
    for dir_list in ${SETUP_DIR_LIST[@]}; do
        filename=$(find ~/.dotfiles/${dir_list} -maxdepth 1 -name ".*")
        for file in ${filename[@]}; do
            if [ -e ~/${file##*/} ]; then
                max=$(expr ${max} + 1)
            fi
        done
    done

    ## Remove
    count=0
    for dir_list in ${SETUP_DIR_LIST[@]}; do
        filename=$(find ~/.dotfiles/${dir_list} -maxdepth 1 -name ".*")
        for file in ${filename[@]}; do
            if [ -e ~/${file##*/} ]; then
                count=$(expr ${count} + 1)
                printf "[%3d/%3d] Removing : %s\n" ${count} ${max} ~/${file##*/}
                rm -rf ~/${file##*/}
            fi
        done
    done
}

uninstall() {
    remove_symlink
    # Remove exception dotfiles
    echo "Removing any file and directory"

    EXCEPTION_DOTFILES=(
        .bash_history
        .cache
        .cdbookmark
        .cdd
        .lesshst
        .tweetvim
        .viminfo
    )

    ## Calc max
    max=0
    for file in ${EXCEPTION_DOTFILES[@]}; do
        if [ -e ~/${file} ]; then
            max=$(expr ${max} + 1)
        fi
    done

    ## Remove
    count=0
    for file in ${EXCEPTION_DOTFILES[@]}; do
        if [ -e ~/${file} ]; then
            count=$(expr ${count} + 1)
            printf "[%3d/%3d] Removing : %s\n" ${count} ${max} ~/${file}
            rm -rf ~/${file}
        fi
    done

    ## dotsetup
    rm ~/bin/dotsetup
    if [ -z $(\ls ~/bin) ]; then
        rm -rf ~/bin
    fi

    ## dotfiles*
    rm -rf ~/.dotfiles_backup
    rm -rf ~/.dotfiles

    echo -e "Uninstalled\n"
}

if [ "$DOTFILES_REINSTALL" = "1" ]; then
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
