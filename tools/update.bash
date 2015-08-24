#!/bin/bash

source ~/.dotfiles/tools/lib/base.bash

# Pull remote repository
printf "Checking repository..."
{
  sleep 1
  git -C ~/.dotfiles pull origin master
} | env LESS="-cE" less
cprint "done" $CYAN_B
## Submodule
printf "Checking submodule..."
{
  sleep 1
  git -C ~/.dotfiles submodule foreach 'git checkout master ; git pull'
} | env LESS="-cE" less
cprint "done" $CYAN_B

# Backup
source ~/.dotfiles/tools/backup.bash

# Deploy
source ~/.dotfiles/tools/deploy.bash

# Update plugin
## Zsh
if [ -d ~/.zsh/bundle/antigen ]; then
  printf "Update Zsh plugin..."
  zsh ~/.dotfiles/tools/update_zsh_plugin.zsh
  cprint "done" $CYAN_B
fi
## Vim
if [ -d ~/.vim/bundle/neobundle.vim ]; then
  printf "Update Vim plugin..."
  vim +NeoBundleUpdate +qall
  cprint "done" $CYAN_B
fi
## Tmux
if [ -d ~/.tmux/plugins/tpm ]; then
  printf "Update Tmux plugin..."
  bash ~/.tmux/plugins/tpm/scripts/update_plugin_prompt.sh
  cprint "done" $CYAN_B
fi
echo
