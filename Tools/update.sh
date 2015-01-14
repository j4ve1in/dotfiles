#!/bin/bash
update() {
    printf "Checking repository..."
    git -C ~/.dotfiles pull > /dev/null
    echo -e "\e[1;34mdone\e[m"
    bash ~/.dotfiles/Tools/create_symlink.sh

    echo -e "Updated\n"
}
update
