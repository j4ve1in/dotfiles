#!/bin/bash
READ_FILE_NAME="setup_list"
SETUP_DIR_LIST=$(cat ~/.dotfiles/Tools/${READ_FILE_NAME})
DATE=$(date +"%Y-%m-%d_%H%M%S")
backup() {
    # ドットファイルすべてをバックアップする方法ではなく、ripositoryと重複するファイルだけバックアップする（競合しそうなファイルも一緒に移動させる）
    printf "Creating backup directory..."
    mkdir -p ~/.dotfiles_backup/${DATE}
    echo -e "\e[1;34mdone\e[m"

    # file
    echo "Copy file"
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

    count=1
    for dir_list in ${SETUP_DIR_LIST[@]}; do
        filename=$(find ~/.dotfiles/${dir_list} -maxdepth 1 -type f)
        for file in ${filename[@]}; do
            if [ -e ~/${file##*/} ]; then
                printf "[%3d/%3d] Copying : %s\n" ${count} ${max} ${file##*/}
                cp ~/${file##*/} ~/.dotfiles_backup/${DATE}
                count=$(expr ${count} + 1)
            fi
        done
    done

    # dir
    echo "Copy directory"
    count=1
    dirname=(".vim" ".vimrc.d" ".zshrc.d")
    for dir in ${dirname[@]}; do
        if [ -d ~/${dir} ]; then
            printf "[%3d/%3d] Copying : %s\n" ${count} ${#dirname[@]} ${dir}
            cp -r ~/${dir} ~/.dotfiles_backup/${DATE}
            count=$(expr ${count} + 1)
        fi
    done
}
backup
echo -e "Backup Complete\n"
