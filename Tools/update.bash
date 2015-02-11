#!/bin/bash
update() {
    printf "Checking repository..."
    git -C ~/.dotfiles pull origin master > /dev/null 2>&1
    git -C ~/.dotfiles/Shell/Zsh/.zsh/function/cd-bookmark submodule foreach 'git checkout master ; git pull' > /dev/null 2>&1
    git -C ~/.dotfiles/Shell/Zsh/.zsh/function/cd-bookmark submodule update > /dev/null 2>&1
    git -C ~/.dotfiles/Shell/Zsh/.zsh/function/cd-gitroot submodule foreach 'git checkout master ; git pull' > /dev/null 2>&1
    git -C ~/.dotfiles/Shell/Zsh/.zsh/function/cd-gitroot submodule update > /dev/null 2>&1
    git -C ~/.dotfiles/Shell/Zsh/.zsh/plugin/cdd submodule foreach 'git checkout master ; git pull' > /dev/null 2>&1
    git -C ~/.dotfiles/Shell/Zsh/.zsh/plugin/cdd submodule update > /dev/null 2>&1
    git -C ~/.dotfiles/Shell/Zsh/.zsh/plugin/zaw submodule foreach 'git checkout master ; git pull' > /dev/null 2>&1
    git -C ~/.dotfiles/Shell/Zsh/.zsh/plugin/zaw submodule update > /dev/null 2>&1
    git -C ~/.dotfiles/Shell/Zsh/.zsh/plugin/zsh-autosuggestions submodule foreach 'git checkout master ; git pull' > /dev/null 2>&1
    git -C ~/.dotfiles/Shell/Zsh/.zsh/plugin/zsh-autosuggestions submodule update > /dev/null 2>&1
    git -C ~/.dotfiles/Shell/Zsh/.zsh/plugin/zsh-bd submodule foreach 'git checkout master ; git pull' > /dev/null 2>&1
    git -C ~/.dotfiles/Shell/Zsh/.zsh/plugin/zsh-bd submodule update > /dev/null 2>&1
    echo -e "\e[1;34mdone\e[m"
    source ~/.dotfiles/Tools/create_symlink.bash
    cp ~/.dotfiles/Tools/setup.bash ~/bin/dotsetup
    echo "Vim Setting"
    vim +NeoBundleUpdate +qall

    echo -e "Updated\n"
}
update
