#!/bin/bash
READ_FILE_NAME="setup_list"
SETUP_DIR_LIST=$(cat ~/.dotfiles/Tools/${READ_FILE_NAME})

remove_symlink() {
    printf "Removing any symbolic link..."
    # file
    # ドットファイル以外のリンクを作成しないようにする
    for dir_list in ${SETUP_DIR_LIST[@]}; do
        filename=$(find ~/.dotfiles/${dir_list} -maxdepth 1 -type f -name ".*")
        for file in ${filename[@]}; do
            rm ~/${file##*/}
        done
    done


    # dir
    ## Vim
    rm -rf ~/.vim
    rm -rf ~/.vimrc.d

    ## Zsh
    rm -rf ~/.zsh
    rm -rf ~/.zshrc.d

    ## Emacs
    rm -rf ~/.emacs.d

    echo -e "\e[1;34mdone\e[m"

}

uninstall() {
    remove_symlink
    printf "Removing any file and directory..."
    rm -rf ~/.dotfiles_backup
    rm -rf ~/.zsh/plugins

    if [ $USER = "root" ] || [ $OSTYPE = "cygwin" ]; then
        rm /usr/local/bin/dotsetup
    else
        INSTALL_USER=${USER}
        printf "root Password: "
        su -c "rm /usr/local/bin/dotsetup ; exit"
    fi

    rm -rf ~/.dotfiles

    echo -e "\e[1;34mdone\e[m"
    
    echo -e "Uninstalled\n"
}

if [ "$1" = "-y" ]; then
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
