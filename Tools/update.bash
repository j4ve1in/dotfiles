#!/bin/bash
update() {
    printf "Checking repository..."
    git -C ~/.dotfiles pull origin master > /dev/null 2>&1
    git -C ~/.dotfiles/Shell/Zsh/.zsh/plugin/zaw submodule foreach 'git checkout master ; git pull' > /dev/null 2>&1
    git -C ~/.dotfiles/Shell/Zsh/.zsh/plugin/zaw submodule update > /dev/null 2>&1
    echo -e "\e[1;34mdone\e[m"
    source ~/.dotfiles/Tools/create_symlink.bash
    cp ~/.dotfiles/Tools/setup.bash ~/bin/dotsetup
    echo "Vim Setting"
    vim +NeoBundleUpdate +qall

    echo -e "Updated\n"
}
update
