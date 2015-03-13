#!/bin/bash
mkdir -p ~/.local.d
cp ~/.dotfiles/sample/aliases.local.sample ~/.local.d/aliases.local
cp ~/.dotfiles/sample/gitconfig.local.sample ~/.local.d/gitconfig.local
echo "Git Settings"
printf "Username: "
read GIT_USERNAME
sed -e "s/USERNAME/${GIT_USERNAME}/g" ~/.local.d/gitconfig.local
printf "Email Address: "
read GIT_EMAILADDRESS
sed -e "s/EMAILADDRESS/${GIT_EMAILADDRESS}/g" ~/.local.d/gitconfig.local

echo -e "Deployed\n"

exit 0
