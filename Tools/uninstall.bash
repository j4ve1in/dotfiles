#!/bin/bash
source ~/.dotfiles/Tools/load_list.bash

remove_symlink() {
    printf "Removing any symbolic link..."
    # file
    for dir_list in ${SETUP_DIR_LIST[@]}; do
        filename=$(find ~/.dotfiles/${dir_list} -maxdepth 1 -type f -name ".*")
        for file in ${filename[@]}; do
            rm ~/${file##*/}
        done
    done


    # dir
    ## Bash
    rm -rf ~/.bashrc.d

    ## Emacs
    rm -rf ~/.emacs.d

    ## Vim
    rm -rf ~/.vim
    rm -rf ~/.vimrc.d
    rm -rf ~/.vimrc.plugin.d

    ## Zsh
    rm -rf ~/.zsh
    rm -rf ~/.zsh.plugin.d
    rm -rf ~/.zshrc.d

    echo -e "\e[1;34mdone\e[m"

}

uninstall() {
    remove_symlink
    printf "Removing any file and directory..."
    if [ -e ~/.bash_history ]; then
        rm ~/.bash_history
    fi
    if [ -e ~/.cache ]; then
        rm -rf ~/.cache
    fi
    if [ -e ~/.cdbookmark ]; then
        rm ~/.cdbookmark
    fi
    if [ -e ~/.cdd ]; then
        rm ~/.cdd
    fi
    if [ -e ~/.lesshst ]; then
        rm ~/.lesshst
    fi
    if [ -e ~/.lesshst ]; then
        rm -rf ~/.tweetvim
    fi
    if [ -e ~/.lesshst ]; then
        rm ~/.viminfo
    fi

    # dotsetup
    rm ~/bin/dotsetup
    if [ -e ~/bin/* ]; then
        rm -rf ~/bin
    fi

    # dotfiles*
    rm -rf ~/.dotfiles_backup
    rm -rf ~/.dotfiles

    echo -e "\e[1;34mdone\e[m"

    echo -e "Uninstalled\n"
}

if [ "$DOTFILES_REINSTALL" = "1" ]; then
    uninstall
else
    printf "Are you sure you want to continue (yes/no)? "
    read ANSWER

    ANSWER=$(echo $ANSWER | tr y Y | tr -d '[\[\]]')
    case $ANSWER in
        ""|Y* )
            uninstall
            ;;
        *  )
            echo
            ;;
    esac
fi
