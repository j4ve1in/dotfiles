#!/bin/bash
update() {
    printf "Checking repository..."
    git -C ~/.dotfiles pull origin master > /dev/null 2>&1
    git -C ~/.dotfiles/Shell/Zsh/.zsh.plugin.d/zaw submodule foreach 'git checkout master ; git pull' > /dev/null 2>&1
    git -C ~/.dotfiles/Shell/Zsh/.zsh.plugin.d/zaw submodule update > /dev/null 2>&1
    echo -e "\e[1;34mdone\e[m"
    source ~/.dotfiles/Tools/create_symlink.sh
    cp ~/.dotfiles/Tools/setup.sh ~/bin/dotsetup
    echo "Vim Setting"
    vim +NeoBundleUpdate +qall

    echo -e "Updated\n"
}
update
