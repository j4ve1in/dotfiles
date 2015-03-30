#!/bin/bash
source ~/.dotfiles/tools/load_list.bash

echo "Start creating symbolic link"

# File
echo "File"
## Calc max
max=0
for dotpath in ${DOT_PATH_LIST[@]}; do
    filename=$(find ~/.dotfiles/${dotpath} -maxdepth 1 -type f -name ".*")
    for file in ${filename[@]}; do
        max=$(expr ${max} + 1)
    done
done

## Create
count=0
for dotpath in ${DOT_PATH_LIST[@]}; do
    filename=$(find ~/.dotfiles/${dotpath} -maxdepth 1 -type f -name ".*")
    for file in ${filename[@]}; do
        count=$(expr ${count} + 1)
        printf "[%2d/%2d] Creating symlink: %-35s | type: %s\n" ${count} ${max} ~/${file##*/} ${dotpath}
        ln -sf ${file} ~/${file##*/}
    done
done

# Directory
echo "Directory"
## Calc max
max=0
for dotpath in ${DOT_PATH_LIST[@]}; do
    filename=$(find ~/.dotfiles/${dotpath} -maxdepth 1 -type d -name ".*")
    for file in ${filename[@]}; do
        max=$(expr ${max} + 1)
    done
done

## Create
count=0
for dotpath in ${DOT_PATH_LIST[@]}; do
    filename=$(find ~/.dotfiles/${dotpath} -maxdepth 1 -type d -name ".*")
    for file in ${filename[@]}; do
        count=$(expr ${count} + 1)
        printf "[%2d/%2d] Creating symlink: %-35s | type: %s\n" ${count} ${max} ~/${file##*/} ${dotpath}
        ln -sf ${file} ~
    done
done

echo -e "Created symbolic link\n"
