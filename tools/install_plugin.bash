#!/bin/bash

# Start install plugin
echo -e "\033[4;39mStarting install plugin\033[0;39m"
## install shell plugin
printf "Installing shell plugin..."
{ sleep 1; git submodule update --init; } | env LESS="-cE" less
echo -e "\033[1;36mdone\033[0;39m"
## install editor plugin
echo "Installing editor plugin"
printf "Installing NeoBundle..."
{ sleep 1; git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim; } | env LESS="-cE" less
echo -e "\033[1;36mdone\033[0;39m"
printf "Installing other plugin..."
vim +NeoBundleInstall +q
echo -e "\033[1;36mdone\033[0;39m"
echo -e "Installed plugin\n"
