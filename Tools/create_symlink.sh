#!/bin/bash
READ_FILE_NAME="setup_list"
SETUP_DIR_LIST=$(cat ~/.dotfiles/Tools/${READ_FILE_NAME})

create_symlink() {
    printf "Creating any symbolic link..."
    # file
    # ドットファイル以外のリンクを作成しないようにする
    for dir_list in ${SETUP_DIR_LIST[@]}; do
        filename=$(find ~/.dotfiles/${dir_list} -maxdepth 1 -type f -name ".*")
        for file in ${filename[@]}; do
            ln -sf ${file} ~/${file##*/}
        done
    done


    # dir
    ## .vim
    ## .vim自体のシンボリックリンクを作成すると.vimにbundleを入れたとき、bundleフォルダも同期されてしまうので、リポジトリ内の.vimの中身だけリンクさせる。(最新版のプラグインを使うため、リポジトリにはbundleを入れていない。)
    mkdir -p ~/.vim #作成したいファイルの下の階層のフォルダはあらかじめつくらないと余計なフォルダのリンクも作成されてしまう
    vimdir_list=$(find ~/.dotfiles/Editor/Vim/.vim -maxdepth 1 -mindepth 1 ! -name "bundle")
    for dir in ${vimdir_list[@]};
    do
        ln -sf ${dir} ~/.vim
    done
    ## NeoBundle
    mkdir -p ~/.vim/bundle
    ln -sf ~/.dotfiles/Editor/Vim/.vim/bundle/neobundle.vim ~/.vim/bundle

    ## .vimrc.d
    ln -sf ~/.dotfiles/Editor/Vim/.vimrc.d ~

    ## .zshrc.d
    ln -sf ~/.dotfiles/Shell/Zsh/.zshrc.d ~

    echo -e "\e[1;34mdone\e[m"
}
create_symlink
echo -e "Created symbolic link\n"
