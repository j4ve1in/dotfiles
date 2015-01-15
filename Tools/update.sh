#!/bin/bash
update() {
    printf "Checking repository..."
    git -C ~/.dotfiles pull origin master > /dev/null 2>&1
    echo -e "\e[1;34mdone\e[m"
    bash ~/.dotfiles/Tools/create_symlink.sh

    echo -e "Updated\n"
}
update
