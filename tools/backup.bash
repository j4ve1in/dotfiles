#!/bin/bash
source ~/.dotfiles/tools/load_list.bash

# Calc max
printf "Checking backup file..."
## File
filemax=0
for dotpath in ${DOT_PATH_LIST[@]}; do
    filename=$(find ~/.dotfiles/${dotpath} -maxdepth 1 -type f -name ".*")
    for file in ${filename[@]}; do
        if [ -e ~/${file##*/} ]; then
            filemax=$(expr ${filemax} + 1)
        fi
    done
done

for file in ${EX_DOTFILE_LIST[@]}; do
    if [ -f ~/${file} ]; then
        filemax=$(expr ${filemax} + 1)
    fi
done

## Directory
dirmax=0
for dotpath in ${DOT_PATH_LIST[@]}; do
    filename=$(find ~/.dotfiles/${dotpath} -maxdepth 1 -type d -name ".*")
    for file in ${filename[@]}; do
        if [ -e ~/${file##*/} ]; then
            dirmax=$(expr ${dirmax} + 1)
        fi
    done
done

for file in ${EX_DOTFILE_LIST[@]}; do
    if [ -d ~/${file} ]; then
        dirmax=$(expr ${dirmax} + 1)
    fi
done

echo -e "\033[1;36mdone\033[0;39m"

if [ ! "${filemax}" = "0" -o ! "${dirmax}" = "0" ]; then
    # Create backup dir
    DATE=$(date +"%Y-%m-%d_%H%M%S")
    printf "Creating backup directory..."
    mkdir -p ~/.dotfiles/backup/${DATE}
    echo -e "\033[1;36mdone\033[0;39m"

    # Start backup
    echo "Starting backup"
    ## File
    if [ ! "${filemax}" = "0" ]; then
        echo "Copy File"
        count=0
        for dotpath in ${DOT_PATH_LIST[@]}; do
            filename=$(find ~/.dotfiles/${dotpath} -maxdepth 1 -type f -name ".*")
            for file in ${filename[@]}; do
                if [ -e ~/${file##*/} ]; then
                    count=$(expr ${count} + 1)
                    printf "[%2d/%2d] Copying: %-35s | type: %s\n" ${count} ${filemax} ~/${file##*/} ${dotpath}
                    cp ~/${file##*/} ~/.dotfiles/backup/${DATE}
                fi
            done
        done

        for file in ${EX_DOTFILE_LIST[@]}; do
            if [ -f ~/${file} ]; then
                count=$(expr ${count} + 1)
                printf "[%2d/%2d] Copying: %-35s | type: exdotfile\n" ${count} ${filemax} ~/${file}
                cp ~/${file} ~/.dotfiles/backup/${DATE}
            fi
        done
    fi

    ## Directory
    if [ ! "${dirmax}" = "0" ]; then
        echo "Copy Directory"
        count=0
        for dotpath in ${DOT_PATH_LIST[@]}; do
            filename=$(find ~/.dotfiles/${dotpath} -maxdepth 1 -type d -name ".*")
            for file in ${filename[@]}; do
                if [ -e ~/${file##*/} ]; then
                    count=$(expr ${count} + 1)
                    printf "[%2d/%2d] Copying: %-35s | type: %s\n" ${count} ${dirmax} ~/${file##*/} ${dotpath}
                    cp -r ~/${file##*/}/ ~/.dotfiles/backup/${DATE}
                fi
            done
        done

        for file in ${EX_DOTFILE_LIST[@]}; do
            if [ -d ~/${file} ]; then
                count=$(expr ${count} + 1)
                printf "[%2d/%2d] Copying: %-35s | type: exdotfile\n" ${count} ${dirmax} ~/${file}
                cp -r ~/${file}/ ~/.dotfiles/backup/${DATE}
            fi
        done
    fi

    echo -e "Backup Complete\n"
else
    echo -e "Backup file doesn't exist\n"
fi
