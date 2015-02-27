#!/bin/bash

# Pull remote repository
printf "Checking repository..."
git -C ~/.dotfiles pull origin master > /dev/null 2>&1
git submodule foreach 'git checkout master ; git pull' > /dev/null 2>&1
echo -e "\033[1;36mdone\033[0;39m"

# Backup
source ~/.dotfiles/tools/backup.bash

# Create symlink
source ~/.dotfiles/tools/create_symlink.bash

# Dotsetup
printf "Update dotsetup..."
cp ~/.dotfiles/tools/setup.bash ~/bin/dotsetup
echo -e "\033[1;36mdone\033[0;39m"

# Vim
printf "Update vim..."
vim +NeoBundleUpdate +qall
echo -e "\033[1;36mdone\033[0;39m"

echo -e "Updated\n"

exit 0
