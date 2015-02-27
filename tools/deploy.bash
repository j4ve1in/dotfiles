#!/bin/bash
mkdir -p ~/.local
cp ~/.dotfiles/sample/.aliases.local.sample ~/.local/.aliases.local
cp ~/.dotfiles/sample/.gitconfig.local.sample ~/.local/.gitconfig.local
echo "Git Settings"
printf "Username: "
read GIT_USERNAME
sed -e "s/USERNAME/${GIT_USERNAME}/g" ~/.local/.gitconfig.local
printf "Email Address: "
read GIT_EMAILADDRESS
sed -e "s/EMAILADDRESS/${GIT_EMAILADDRESS}/g" ~/.local/.gitconfig.local

echo -e "Deployed\n"

exit 0
