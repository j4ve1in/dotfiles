#!/bin/bash
source ~/.dotfiles/Tools/load_list.bash

create_symlink() {
    # ready
    echo "Getting ready"
    printf "Creating directory..."
    # 作成したいファイルの下の階層のフォルダはあらかじめつくらないと余計なフォルダのリンクも作成されてしまう
    mkdir -p ~/.vim
    mkdir -p ~/.zsh
    echo -e "\e[1;34mdone\e[m"

    echo "Creating any symbolic link"

    # file
    echo "File"
    # 総数を計算
    max=0
    for dir_list in ${SETUP_DIR_LIST[@]}; do
        filename=$(find ~/.dotfiles/${dir_list} -maxdepth 1 -type f -name ".*")
        for file in ${filename[@]}; do
            max=$(expr ${max} + 1)
        done
    done
    # ~/.zsh/.zshrc and ~/.zsh/.zshrc.zwc
    max=$(expr ${max} + 2)

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
    # ~/.zsh/.zshrc
    count=$(expr ${count} + 1)
    printf "[%3d/%3d] Creating symbolic link: %s\n" ${count} ${max} ~/.zsh/.zshrc
    ln -sf ~/.dotfiles/Shell/Zsh/.zsh/.zshrc ~/.zsh/.zshrc
    # ~/.zsh/.zshrc.zwc
    count=$(expr ${count} + 1)
    printf "[%3d/%3d] Creating symbolic link: %s\n" ${count} ${max} ~/.zsh/.zshrc.zwc
    ln -sf ~/.dotfiles/Shell/Zsh/.zsh/.zshrc.zwc ~/.zsh/.zshrc.zwc

    # dir
    echo "Directory"
    max=0
    vimdir_list=$(find ~/.dotfiles/Editor/Vim/.vim -maxdepth 1 -mindepth 1 -type d)
    zshdir_list=$(find ~/.dotfiles/Shell/Zsh/.zsh -maxdepth 1 -mindepth 1 -type d)
    for file in ${vimdir_list[@]} ${zshdir_list[@]}; do
        max=$(expr ${max} + 1)
    done
    max=$(expr ${max} + 6)
    count=0

    ## .bashrc.d
    count=$(expr ${count} + 1)
    printf "[%3d/%3d] Creating symbolic link: %s\n" ${count} ${max} ~/.bashrc.d
    ln -sf ~/.dotfiles/Shell/Bash/.bashrc.d ~

    ## .vim
    for dir in ${vimdir_list[@]}; do
        count=$(expr ${count} + 1)
        printf "[%3d/%3d] Creating symbolic link: %s\n" ${count} ${max} ~/.vim/${dir##*/}
        ln -sf ${dir} ~/.vim
    done

    ## .vimrc.d
    count=$(expr ${count} + 1)
    printf "[%3d/%3d] Creating symbolic link: %s\n" ${count} ${max} ~/.vimrc.d
    ln -sf ~/.dotfiles/Editor/Vim/.vimrc.d ~

    ## .vimrc.plugin.d
    count=$(expr ${count} + 1)
    printf "[%3d/%3d] Creating symbolic link: %s\n" ${count} ${max} ~/.vimrc.plugin.d
    ln -sf ~/.dotfiles/Editor/Vim/.vimrc.plugin.d ~

    ## .zsh
    for dir in ${zshdir_list[@]}; do
        count=$(expr ${count} + 1)
        printf "[%3d/%3d] Creating symbolic link: %s\n" ${count} ${max} ~/.zsh/${dir##*/}
        ln -sf ${dir} ~/.zsh
    done

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
