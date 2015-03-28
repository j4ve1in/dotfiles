#!/bin/bash

# Start install plugin
echo "Starting install plugin"
## install shell plugin
printf "Installing shell plugin..."
export LESS="-cE"; { sleep 1; git submodule update --init; } | less
echo -e "\033[1;36mdone\033[0;39m"
## install editor plugin
echo "Installing editor plugin"
printf "Installing NeoBundle..."
export LESS="-cE"; { sleep 1; git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim; } | less
echo -e "\033[1;36mdone\033[0;39m"
printf "Installing other plugin..."
vim +NeoBundleInstall +q
echo -e "\033[1;36mdone\033[0;39m"
echo -e "Installed plugin\n"
