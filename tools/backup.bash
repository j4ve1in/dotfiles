#!/bin/bash
source ~/.dotfiles/tools/load_list.bash

DATE=$(date +"%Y-%m-%d_%H%M%S")
printf "Creating backup directory..."
mkdir -p ~/.dotfiles_backup/${DATE}
echo -e "\033[1;36mdone\033[0;39m"

echo "Starting backup"

# File
echo "File"
# Calc max
max=0
for dir_list in ${DIR_LIST[@]}; do
    filename=$(find ~/.dotfiles/${dir_list} -maxdepth 1 -type f -name ".*")
    for file in ${filename[@]}; do
        if [ -e ~/${file##*/} ]; then
            max=$(expr ${max} + 1)
        fi
    done
done

for file in ${EXCEPTIONFILE_LIST[@]}; do
    if [ -f ~/${file} ]; then
        max=$(expr ${max} + 1)
    fi
done

# Create
count=0
for dir_list in ${DIR_LIST[@]}; do
    filename=$(find ~/.dotfiles/${dir_list} -maxdepth 1 -type f -name ".*")
    for file in ${filename[@]}; do
        if [ -e ~/${file##*/} ]; then
            count=$(expr ${count} + 1)
            printf "[%3d/%3d] Copying: %s\n" ${count} ${max} ~/${file##*/}
            cp ~/${file##*/} ~/.dotfiles_backup/${DATE}
        fi
    done
done

for file in ${EXCEPTIONFILE_LIST[@]}; do
    if [ -f ~/${file} ]; then
        count=$(expr ${count} + 1)
        printf "[%3d/%3d] Copying: %s\n" ${count} ${max} ~/${file}
        cp ~/${file} ~/.dotfiles_backup/${DATE}
    fi
done

# Directory
echo "Directory"
# Calc max
max=0
for dir_list in ${DIR_LIST[@]}; do
    filename=$(find ~/.dotfiles/${dir_list} -maxdepth 1 -type d -name ".*")
    for file in ${filename[@]}; do
        if [ -e ~/${file##*/} ]; then
            max=$(expr ${max} + 1)
        fi
    done
done

for file in ${EXCEPTIONFILE_LIST[@]}; do
    if [ -d ~/${file} ]; then
        max=$(expr ${max} + 1)
    fi
done

# Create
count=0
for dir_list in ${DIR_LIST[@]}; do
    filename=$(find ~/.dotfiles/${dir_list} -maxdepth 1 -type d -name ".*")
    for file in ${filename[@]}; do
        if [ -e ~/${file##*/} ]; then
            count=$(expr ${count} + 1)
            printf "[%3d/%3d] Copying: %s\n" ${count} ${max} ~/${file##*/}
            cp -r ~/${file##*/}/ ~/.dotfiles_backup/${DATE}
        fi
    done
done

for file in ${EXCEPTIONFILE_LIST[@]}; do
    if [ -d ~/${file} ]; then
        count=$(expr ${count} + 1)
        printf "[%3d/%3d] Copying: %s\n" ${count} ${max} ~/${file}
        cp -r ~/${file}/ ~/.dotfiles_backup/${DATE}
    fi
done

echo -e "Backup Complete\n"
