#!/bin/bash

. ~/.dotfiles/tools/lib/base.bash

# Pull remote repository
cprint 'Update dotfiles' $UNDERLINE
lprintf ' Checking repository' "git -C ${HOME}/.dotfiles pull origin master"
echo

# Backup
. ~/.dotfiles/tools/backup.bash

# Deploy
. ~/.dotfiles/tools/deploy.bash

echo
