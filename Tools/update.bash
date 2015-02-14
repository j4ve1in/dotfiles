#!/bin/bash

# Pull remote repository
printf "Checking repository..."
git -C ~/.dotfiles pull origin master > /dev/null 2>&1
git submodule foreach 'git checkout master ; git pull' > /dev/null 2>&1
echo -e "\e[1;34mdone\e[m"

# Backup
source ~/.dotfiles/Tools/backup.bash

# Create symlink
source ~/.dotfiles/Tools/create_symlink.bash

cp ~/.dotfiles/Tools/setup.bash ~/bin/dotsetup
echo "Vim Setting"
vim +NeoBundleUpdate +qall

echo -e "Updated\n"

exit 0
