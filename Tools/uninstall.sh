#!/bin/bash
source ~/.dotfiles/Tools/load_list.sh

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
    rm -rf ~/.vimrc.plugin.d

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

    rm ~/bin/dotsetup

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
