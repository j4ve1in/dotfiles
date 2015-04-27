#!/bin/bash

# Start install plugin
echo -e "\033[4;39mStarting install plugin\033[0;39m"
## install plugin manager
printf "Installing plugin manager..."
{ sleep 1; git -C ~/.dotfiles submodule update --init; } | env LESS="-cE" less
echo -e "\033[1;36mdone\033[0;39m"
## install editor plugin
printf "Installing vim plugin..."
vim +NeoBundleInstall +q
echo -e "\033[1;36mdone\033[0;39m"
echo -e "Installed plugin\n"
