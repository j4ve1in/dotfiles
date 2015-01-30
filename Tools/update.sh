#!/bin/bash
update() {
    printf "Checking repository..."
    git -C ~/.dotfiles pull origin master > /dev/null 2>&1
    echo -e "\e[1;34mdone\e[m"
    bash ~/.dotfiles/Tools/create_symlink.sh
    echo "Vim Setting..."
    vim +NeoBundleUpdate +qall
    echo -e "\e[1;34mdone\e[m"

    echo -e "Updated\n"
}
update
