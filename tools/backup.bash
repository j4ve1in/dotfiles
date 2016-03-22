#!/bin/bash

source ~/.dotfiles/tools/lib/base.bash
source_dotool lib/dot

cprint "Backup dotfiles" $UNDERLINE
git -C "$DOT_DIR" stash >/dev/null 2>&1
git -C "$DOT_DIR" branch | grep backup >/dev/null 2>&1
if [ "$?" = "0" ]; then
  git -C "$DOT_DIR" checkout backup >/dev/null 2>&1
elif [ "$?" = "1" ]; then
  git -C "$DOT_DIR" checkout --orphan backup
fi
git -C "$DOT_DIR" add -A
git -C "$DOT_DIR" commit -m "backup dotfiles $(date +'at %H:%M:%S on %B the %d, %Y')" | head -n 10
echo "Try 'git -C ~/.dotfiles log' for more information."
git -C "$DOT_DIR" checkout master >/dev/null 2>&1
git -C "$DOT_DIR" stash pop >/dev/null 2>&1

echo
interval 500000
