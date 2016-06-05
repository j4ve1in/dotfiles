#!/bin/bash

. ~/.dotfiles/tools/lib/base.bash

# Check dotfiles version
cprint 'Check for updates' $UNDERLINE
LOCAL=$(git -C ~/.dotfiles rev-parse --short HEAD)
REMOTE=$(git -C ~/.dotfiles rev-parse --short origin/HEAD)
cprintf ' Dotfiles version: ' "$COLOR_75_B"
if [ "$LOCAL" = "$REMOTE" ]; then
  echo -e 'up to date\n'
else
  echo -e 'local out of date\n'

  # Pull remote repository
  cprint 'Update dotfiles' $UNDERLINE
  lprintf ' Pull remote repository' "git -C ${HOME}/.dotfiles pull origin master"
  printf "  $LOCAL"
  cprintf ' -> ' $COLOR_93_B
  print "$REMOTE"
  echo

  # Backup
  . ~/.dotfiles/tools/backup.bash

  # Deploy
  . ~/.dotfiles/tools/deploy.bash
fi
