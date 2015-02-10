#!/bin/bash
source ~/.dotfiles/Tools/load_list.bash

create_symlink() {
    # ready
    echo "Getting ready"
    printf "Creating directory..."
    mkdir -p ~/.vim #作成したいファイルの下の階層のフォルダはあらかじめつくらないと余計なフォルダのリンクも作成されてしまう
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

    # file
    count=1
    # ドットファイル以外のリンクを作成しないようにする
    for dir_list in ${SETUP_DIR_LIST[@]}; do
        filename=$(find ~/.dotfiles/${dir_list} -maxdepth 1 -type f -name ".*")
        for file in ${filename[@]}; do
            printf "[%3d/%3d] Creating symbolic link: %s\n" ${count} ${max} ~/${file##*/}
            ln -sf ${file} ~/${file##*/}
            count=$(expr ${count} + 1)
        done
    done

    # dir
    echo "Directory"
    ## .vim
    ## .vim自体のシンボリックリンクを作成すると余計なファイルも同期されてしまうので、リポジトリ内の.vimの中身だけリンクさせる。
    count=1
    vimdir_list=$(find ~/.dotfiles/Editor/Vim/.vim -maxdepth 1 -mindepth 1)
    max=$(expr ${#vimdir_list[@]} + 3)
    for dir in ${vimdir_list[@]}; do
        printf "[%3d/%3d] Creating symbolic link: %s\n" ${count} ${max} ~/.vim/${dir##*/}
        ln -sf ${dir} ~/.vim
        count=$(expr ${count} + 1)
    done

    ## .vimrc.d
    printf "[%3d/%3d] Creating symbolic link: %s\n" ${count} ${max} ~/.vimrc.d
    ln -sf ~/.dotfiles/Editor/Vim/.vimrc.d ~
    count=$(expr ${count} + 1)

    ## .vimrc.plugin.d
    printf "[%3d/%3d] Creating symbolic link: %s\n" ${count} ${max} ~/.vimrc.plugin.d
    ln -sf ~/.dotfiles/Editor/Vim/.vimrc.plugin.d ~
    count=$(expr ${count} + 1)

    ## .zsh.plugin.d
    printf "[%3d/%3d] Creating symbolic link: %s\n" ${count} ${max} ~/.zsh.plugin.d
    ln -sf ~/.dotfiles/Shell/Zsh/.zsh.plugin.d ~
    count=$(expr ${count} + 1)

    ## .zshrc.d
    printf "[%3d/%3d] Creating symbolic link: %s\n" ${count} ${max} ~/.zshrc.d
    ln -sf ~/.dotfiles/Shell/Zsh/.zshrc.d ~
    count=$(expr ${count} + 1)

    ## .bashrc.d
    printf "[%3d/%3d] Creating symbolic link: %s\n" ${count} ${max} ~/.bashrc.d
    ln -sf ~/.dotfiles/Shell/Bash/.bashrc.d ~
    count=$(expr ${count} + 1)
}
create_symlink
echo -e "Created symbolic link\n"
