#!/bin/bash
source ~/.dotfiles/tools/load_list.bash

# Count max
printf "Checking backup file..."

max=0
for dotpath in ${DOT_PATH_LIST[@]}; do
    filename=$(find ~/.dotfiles/${dotpath} -maxdepth 1 -name ".*")
    for file in ${filename[@]}; do
        if [ -e ~/${file##*/} ]; then
            max=$(expr ${max} + 1)
        fi
    done
done

for file in ${EX_DOTFILE_LIST[@]}; do
    if [ -e ~/${file} ]; then
        max=$(expr ${max} + 1)
    fi
done

echo -e "\033[1;36mdone\033[0;39m"

if [ ! "${filemax}" = "0" -o ! "${dirmax}" = "0" ]; then
    # Create backup dir
    DATE=$(date +"%Y-%m-%d_%H%M%S")
    printf "Creating backup directory..."
    mkdir -p ~/.dotfiles/backup/${DATE}
    echo -e "\033[1;36mdone\033[0;39m"
    # Display backup directory
    echo "Backup directory: ~/.dotfiles/backup/${DATE}"

    # Start backup
    echo -e "\033[4;39mStarting backup\033[0;39m"
    if [ ! "${max}" = "0" ]; then
        count=0
        for dotpath in ${DOT_PATH_LIST[@]}; do
            # File
            filename=$(find ~/.dotfiles/${dotpath} -maxdepth 1 -type f -name ".*")
            for file in ${filename[@]}; do
                if [ -e ~/${file##*/} ]; then
                    count=$(expr ${count} + 1)
                    printf "[%2d/%2d] Copying: %-35s | type: %s\n" ${count} ${max} ~/${file##*/} ${dotpath}
                    cp ~/${file##*/} ~/.dotfiles/backup/${DATE}
                fi
            done
            # Directory
            filename=$(find ~/.dotfiles/${dotpath} -maxdepth 1 -type d -name ".*")
            for file in ${filename[@]}; do
                if [ -e ~/${file##*/} ]; then
                    count=$(expr ${count} + 1)
                    printf "[%2d/%2d] Copying: %-35s | type: %s\n" ${count} ${max} ~/${file##*/} ${dotpath}
                    cp -r ~/${file##*/}/ ~/.dotfiles/backup/${DATE}
                    if [ ! -L ~/${file##*/} -a -d ~/${file##*/} ]; then
                        rm -fr ~/${file##*/}/
                    fi
                fi
            done
        done

        for file in ${EX_DOTFILE_LIST[@]}; do
            # File
            if [ -f ~/${file} ]; then
                count=$(expr ${count} + 1)
                printf "[%2d/%2d] Copying: %-35s | type: exdotfile\n" ${count} ${max} ~/${file}
                cp ~/${file} ~/.dotfiles/backup/${DATE}
            fi
            # Directory
            if [ -d ~/${file} ]; then
                count=$(expr ${count} + 1)
                printf "[%2d/%2d] Copying: %-35s | type: exdotfile\n" ${count} ${max} ~/${file}
                cp -r ~/${file}/ ~/.dotfiles/backup/${DATE}
                if [ ! -L ~/${file} -a -d ~/${file} ]; then
                    rm -fr ~/${file}/
                fi
            fi
        done
    fi
else
    echo -e "Backup file doesn't exist\n"
fi
