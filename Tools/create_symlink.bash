#!/bin/bash
source ~/.dotfiles/Tools/load_list.bash

echo "Creating symbolic link"

# File
echo "File"
## Calc max
max=0
for dir_list in ${DIR_LIST[@]}; do
    filename=$(find ~/.dotfiles/${dir_list} -maxdepth 1 -type f -name ".*")
    for file in ${filename[@]}; do
        max=$(expr ${max} + 1)
    done
done

## Create
count=0
for dir_list in ${DIR_LIST[@]}; do
    filename=$(find ~/.dotfiles/${dir_list} -maxdepth 1 -type f -name ".*")
    for file in ${filename[@]}; do
        count=$(expr ${count} + 1)
        printf "[%3d/%3d] Creating symbolic link: %s\n" ${count} ${max} ~/${file##*/}
        ln -sf ${file} ~/${file##*/}
    done
done

# Directory
echo "Directory"
## Calc max
max=0
for dir_list in ${DIR_LIST[@]}; do
    filename=$(find ~/.dotfiles/${dir_list} -maxdepth 1 -type d -name ".*")
    for file in ${filename[@]}; do
        max=$(expr ${max} + 1)
    done
done

## Create
count=0
for dir_list in ${DIR_LIST[@]}; do
    filename=$(find ~/.dotfiles/${dir_list} -maxdepth 1 -type d -name ".*")
    for file in ${filename[@]}; do
        count=$(expr ${count} + 1)
        printf "[%3d/%3d] Creating symbolic link: %s\n" ${count} ${max} ~/${file##*/}
        ln -sf ${file} ~
    done
done

echo -e "Created symbolic link\n"
