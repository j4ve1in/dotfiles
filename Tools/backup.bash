#!/bin/bash
source ~/.dotfiles/Tools/load_list.bash

DATE=$(date +"%Y-%m-%d_%H%M%S")
printf "Creating backup directory..."
mkdir -p ~/.dotfiles_backup/${DATE}
echo -e "\e[1;34mdone\e[m"

echo "Starting backup"

EXCEPTION_DOTFILES=(
    .bash_history
    .cache
    .cdbookmark
    .cdd
    .lesshst
    .tweetvim
    .viminfo
)

# Calc max
max=0
for dir_list in ${SETUP_DIR_LIST[@]}; do
    filename=$(find ~/.dotfiles/${dir_list} -maxdepth 1 -name ".*")
    for file in ${filename[@]}; do
        if [ -e ~/${file##*/} ]; then
            max=$(expr ${max} + 1)
        fi
    done
done

for file in ${EXCEPTION_DOTFILES[@]}; do
    if [ -e ~/${file} ]; then
        max=$(expr ${max} + 1)
    fi
done

# Create
count=0
for dir_list in ${SETUP_DIR_LIST[@]}; do
    filename=$(find ~/.dotfiles/${dir_list} -maxdepth 1 -name ".*")
    for file in ${filename[@]}; do
        if [ -e ~/${file##*/} ]; then
            count=$(expr ${count} + 1)
            printf "[%3d/%3d] Copying: %s\n" ${count} ${max} ~/${file##*/}
            cp -r ~/${file##*/} ~/.dotfiles_backup/${DATE}
        fi
    done
done

for file in ${EXCEPTION_DOTFILES[@]}; do
    if [ -e ~/${file} ]; then
        count=$(expr ${count} + 1)
        printf "[%3d/%3d] Copying: %s\n" ${count} ${max} ~/${file}
        cp -r ~/${file} ~/.dotfiles_backup/${DATE}
    fi
done

echo -e "Backup Complete\n"
