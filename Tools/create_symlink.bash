#!/bin/bash
source ~/.dotfiles/Tools/load_list.bash

create_symlink() {
    # ready
    echo "Getting ready"
    printf "Creating directory..."
    echo -e "\e[1;34mdone\e[m"

    echo "Creating any symbolic link"

    # file
    echo "File"
    # calc max
    max=0
    for dir_list in ${SETUP_DIR_LIST[@]}; do
        filename=$(find ~/.dotfiles/${dir_list} -maxdepth 1 -type f -name ".*")
        for file in ${filename[@]}; do
            max=$(expr ${max} + 1)
        done
    done

    # file
    count=0
    # ドットファイル以外のリンクを作成しないようにする
    for dir_list in ${SETUP_DIR_LIST[@]}; do
        filename=$(find ~/.dotfiles/${dir_list} -maxdepth 1 -type f -name ".*")
        for file in ${filename[@]}; do
            count=$(expr ${count} + 1)
            printf "[%3d/%3d] Creating symbolic link: %s\n" ${count} ${max} ~/${file##*/}
            ln -sf ${file} ~/${file##*/}
        done
    done

    # dir
    echo "Directory"
    # calc max
    max=0
    max=$(expr ${max} + 8)
    count=0

    ## .bashrc.d
    count=$(expr ${count} + 1)
    printf "[%3d/%3d] Creating symbolic link: %s\n" ${count} ${max} ~/.bashrc.d
    ln -sf ~/.dotfiles/Shell/Bash/.bashrc.d ~

    ## .vim
    count=$(expr ${count} + 1)
    printf "[%3d/%3d] Creating symbolic link: %s\n" ${count} ${max} ~/.vim
    ln -sf ~/.dotfiles/Editor/Vim/.vim ~

    ## .vimrc.d
    count=$(expr ${count} + 1)
    printf "[%3d/%3d] Creating symbolic link: %s\n" ${count} ${max} ~/.vimrc.d
    ln -sf ~/.dotfiles/Editor/Vim/.vimrc.d ~

    ## .vimrc.plugin.d
    count=$(expr ${count} + 1)
    printf "[%3d/%3d] Creating symbolic link: %s\n" ${count} ${max} ~/.vimrc.plugin.d
    ln -sf ~/.dotfiles/Editor/Vim/.vimrc.plugin.d ~

    ## .zsh
    count=$(expr ${count} + 1)
    printf "[%3d/%3d] Creating symbolic link: %s\n" ${count} ${max} ~/.zsh
    ln -sf ~/.dotfiles/Shell/Zsh/.zsh ~

    ## .zshrc.d
    count=$(expr ${count} + 1)
    printf "[%3d/%3d] Creating symbolic link: %s\n" ${count} ${max} ~/.zshrc.d
    ln -sf ~/.dotfiles/Shell/Zsh/.zshrc.d ~

    ## .zshrc.function.d
    count=$(expr ${count} + 1)
    printf "[%3d/%3d] Creating symbolic link: %s\n" ${count} ${max} ~/.zshrc.function.d
    ln -sf ~/.dotfiles/Shell/Zsh/.zshrc.function.d ~

    ## .zshrc.plugin.d
    count=$(expr ${count} + 1)
    printf "[%3d/%3d] Creating symbolic link: %s\n" ${count} ${max} ~/.zshrc.plugin.d
    ln -sf ~/.dotfiles/Shell/Zsh/.zshrc.plugin.d ~
}
create_symlink
echo -e "Created symbolic link\n"
