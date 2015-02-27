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

cp ~/.dotfiles/tools/setup.bash ~/bin/dotsetup
echo "Vim Setting"
vim +NeoBundleUpdate +qall

echo -e "Updated\n"

exit 0
