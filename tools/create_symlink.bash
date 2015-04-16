#!/bin/bash
source ~/.dotfiles/tools/load_list.bash

echo -e "\033[4;39mStart creating symbolic link\033[0;39m"

# Count max
max=0
for dotpath in ${DOT_PATH_LIST[@]}; do
    filename=$(find ~/.dotfiles/${dotpath} -maxdepth 1 -name ".*")
    for file in ${filename[@]}; do
        max=$(expr ${max} + 1)
    done
done

# Create
count=0
for dotpath in ${DOT_PATH_LIST[@]}; do
    # File
    filename=$(find ~/.dotfiles/${dotpath} -maxdepth 1 -type f -name ".*")
    for file in ${filename[@]}; do
        count=$(expr ${count} + 1)
        printf "[%2d/%2d] Creating symlink: %-35s | type: %s\n" ${count} ${max} ~/${file##*/} ${dotpath}
        ln -sf ${file} ~/${file##*/}
    done
    # Directory
    filename=$(find ~/.dotfiles/${dotpath} -maxdepth 1 -type d -name ".*")
    for file in ${filename[@]}; do
        count=$(expr ${count} + 1)
        printf "[%2d/%2d] Creating symlink: %-35s | type: %s\n" ${count} ${max} ~/${file##*/} ${dotpath}
        ln -sf ${file} ~
    done
done

echo
