#!/bin/bash

# Pull remote repository
printf "Checking repository..."
{ sleep 1; git -C ~/.dotfiles pull origin master; } | env LESS="-cE" less
echo -e "\033[1;36mdone\033[0;39m"

# Backup
source ~/.dotfiles/tools/backup.bash

# Create symlink
source ~/.dotfiles/tools/create_symlink.bash

# Update Dotsetup
printf "Update dotsetup..."
cp ~/.dotfiles/tools/setup.bash ~/bin/dotsetup
echo -e "\033[1;36mdone\033[0;39m"

# Update plugin
## shell
if [ -f ~/.plugin/enhancd/enhancd.sh ]; then
    printf "Update shell plugin..."
    { sleep 1; git -C ~/.dotfiles submodule foreach 'git checkout master; git pull'; } | env LESS="-cE" less
    echo -e "\033[1;36mdone\033[0;39m"
fi
## editor
### vim
if [ -f ~/.vim/bundle/neobundle.vim/plugin/neobundle.vim ]; then
    printf "Update vim plugin..."
    vim +NeoBundleUpdate +qall
    echo -e "\033[1;36mdone\033[0;39m"
fi

echo -e "Updated\n"

exit 0
