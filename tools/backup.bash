#!/bin/bash

source ~/.dotfiles/tools/lib/base.bash
source_dotool lib/dot

cprint "Backup dotfiles" $UNDERLINE
export GIT_{AUTHOR,COMMITTER}_NAME='dotsetup'
export GIT_{AUTHOR,COMMITTER}_EMAIL='dotsetup@example.com'
git -C "$DOT_DIR" stash >/dev/null 2>&1
git -C "$DOT_DIR" branch | grep backup >/dev/null 2>&1
if [ "$?" = "0" ]; then
  git -C "$DOT_DIR" checkout backup >/dev/null 2>&1
elif [ "$?" = "1" ]; then
  git -C "$DOT_DIR" checkout --orphan backup
fi
git -C "$DOT_DIR" add -A
git -C "$DOT_DIR" commit -m "backup dotfiles $(date +'at %H:%M:%S on %B the %d, %Y')" | head -n 10
echo 'Try the following command for more information.'
echo "  \$ cd $DOT_DIR"
echo "  \$ git checkout backup && git log && git checkout -"
git -C "$DOT_DIR" checkout master >/dev/null 2>&1
git -C "$DOT_DIR" stash pop >/dev/null 2>&1
unset GIT_{AUTHOR,COMMITTER}_NAME GIT_{AUTHOR,COMMITTER}_EMAIL
echo
