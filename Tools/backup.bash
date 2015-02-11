#!/bin/bash
source ~/.dotfiles/Tools/load_list.bash
backup() {
    DATE=$(date +"%Y-%m-%d_%H%M%S")
    # ドットファイルすべてをバックアップする方法ではなく、ripositoryと重複するファイルだけバックアップする（競合しそうなファイルも一緒に移動させる）
    printf "Creating backup directory..."
    mkdir -p ~/.dotfiles_backup/${DATE}
    echo -e "\e[1;34mdone\e[m"

    # file
    echo "File"
    # 総数を計算
    max=0
    for dir_list in ${SETUP_DIR_LIST[@]}; do
        filename=$(find ~/.dotfiles/${dir_list} -maxdepth 1 -type f)
        for file in ${filename[@]}; do
            if [ -e ~/${file##*/} ]; then
                max=$(expr ${max} + 1)
            fi
        done
    done
    if [ -e ~/.bash_history ]; then
        max=$(expr ${max} + 1)
    fi
    if [ -e ~/.cdbookmark ]; then
        max=$(expr ${max} + 1)
    fi
    if [ -e ~/.cdd ]; then
        max=$(expr ${max} + 1)
    fi
    if [ -e ~/.lesshst ]; then
        max=$(expr ${max} + 1)
    fi
    if [ -e ~/.viminfo ]; then
        max=$(expr ${max} + 1)
    fi

    count=0
    for dir_list in ${SETUP_DIR_LIST[@]}; do
        filename=$(find ~/.dotfiles/${dir_list} -maxdepth 1 -type f)
        for file in ${filename[@]}; do
            if [ -e ~/${file##*/} ]; then
                count=$(expr ${count} + 1)
                printf "[%3d/%3d] Copying : %s\n" ${count} ${max} ~/${file##*/}
                cp ~/${file##*/} ~/.dotfiles_backup/${DATE}
            fi
        done
    done
    # Others
    if [ -e ~/.bash_history ]; then
        count=$(expr ${count} + 1)
        printf "[%3d/%3d] Copying : %s\n" ${count} ${max} ~/.bash_history
        cp ~/.bash_history ~/.dotfiles_backup/${DATE}
    fi
    if [ -e ~/.cdbookmark ]; then
        count=$(expr ${count} + 1)
        printf "[%3d/%3d] Copying : %s\n" ${count} ${max} ~/.cdbookmark
        cp ~/.cdbookmark ~/.dotfiles_backup/${DATE}
    fi
    if [ -e ~/.cdd ]; then
        count=$(expr ${count} + 1)
        printf "[%3d/%3d] Copying : %s\n" ${count} ${max} ~/.cdd
        cp ~/.cdd ~/.dotfiles_backup/${DATE}
    fi
    if [ -e ~/.lesshst ]; then
        count=$(expr ${count} + 1)
        printf "[%3d/%3d] Copying : %s\n" ${count} ${max} ~/.lesshst
        cp ~/.lesshst ~/.dotfiles_backup/${DATE}
    fi
    if [ -e ~/.viminfo ]; then
        count=$(expr ${count} + 1)
        printf "[%3d/%3d] Copying : %s\n" ${count} ${max} ~/.viminfo
        cp ~/.viminfo ~/.dotfiles_backup/${DATE}
    fi

    # dir
    echo "Directory"
    max=0
    count=0
    dirname=(".bashrc.d" ".vim" ".vimrc.d" ".vimrc.plugin.d" ".zsh" ".zshrc.d" ".zshrc.function.d" ".zshrc.plugin.d")
    max=${#dirname[@]}
    if [ -e ~/.cache ]; then
        max=$(expr ${max} + 1)
    fi
    if [ -e ~/.tweetvim ]; then
        max=$(expr ${max} + 1)
    fi
    for dir in ${dirname[@]}; do
        if [ -d ~/${dir} ]; then
            count=$(expr ${count} + 1)
            printf "[%3d/%3d] Copying : %s\n" ${count} ${max} ~/${dir}
            cp -r ~/${dir} ~/.dotfiles_backup/${DATE}
        fi
    done
    # Others
    if [ -e ~/.cache ]; then
        count=$(expr ${count} + 1)
        printf "[%3d/%3d] Copying : %s\n" ${count} ${max} ~/.cache
        cp -r ~/.cache ~/.dotfiles_backup/${DATE}
    fi
    if [ -e ~/.tweetvim ]; then
        count=$(expr ${count} + 1)
        printf "[%3d/%3d] Copying : %s\n" ${count} ${max} ~/.tweetvim
        cp -r ~/.tweetvim ~/.dotfiles_backup/${DATE}
    fi
}
backup
echo -e "Backup Complete\n"
