#!/bin/bash

# Pull remote repository
printf "Checking repository..."
{ sleep 1; git -C ~/.dotfiles pull origin master; } | env LESS="-cE" less
echo -e "\033[1;36mdone\033[0;39m"
printf "Checking submodule..."
{ sleep 1; git -C ~/.dotfiles submodule foreach 'git checkout master ; git pull'; } | env LESS="-cE" less
echo -e "\033[1;36mdone\033[0;39m"

# Backup
source ~/.dotfiles/tools/backup.bash

# Deploy
source ~/.dotfiles/tools/deploy.bash

# Update plugin
## shell
### zsh
if [ -d ~/.zsh/bundle/repos ]; then
  printf "Update zsh plugin..."
  zsh ~/.dotfiles/tools/update_zsh_plugin.zsh
  echo -e "\033[1;36mdone\033[0;39m"
fi
## editor
### vim
if [ -d ~/.vim/bundle/neobundle.vim ]; then
  printf "Update vim plugin..."
  vim +NeoBundleUpdate +qall
  echo -e "\033[1;36mdone\033[0;39m"
fi

echo -e "Updated\n"

exit 0
