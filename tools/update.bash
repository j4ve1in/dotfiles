#!/bin/bash

. ~/.dotfiles/tools/lib/base.bash

# Pull remote repository
printf "Checking repository..."
{
  sleep 1
  git -C ~/.dotfiles pull origin master
} | env LESS="-cE" less
cprint "done" $CYAN_B

# Backup
. ~/.dotfiles/tools/backup.bash

# Deploy
. ~/.dotfiles/tools/deploy.bash

echo
