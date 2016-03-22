#!/bin/bash

source ~/.dotfiles/tools/lib/base.bash
source_dotool lib/dot

cprint "Backup dotfiles" $UNDERLINE
cd "$DOT_DIR"
export GIT_{AUTHOR,COMMITTER}_NAME='dotsetup'
export GIT_{AUTHOR,COMMITTER}_EMAIL='dotsetup@example.com'
git stash >/dev/null 2>&1
git checkout master >/dev/null 2>&1

# create branch
git branch | grep backup >/dev/null 2>&1
if [ "$?" = "1" ]; then
  git checkout --orphan backup
elif [ "$?" = "0" ]; then
  BACKUP_BRANCH="tmp/$(date +'%Y%m%d%H%M%S')"
  git checkout --orphan "$BACKUP_BRANCH"
  MERGE=1
fi

# add and commit
git add -A
git commit -m "backup dotfiles $(date +'at %H:%M:%S on %B the %d, %Y')" | head -n 10
echo 'Try the following command for more information.'
echo "  \$ cd $DOT_DIR"
echo "  \$ git checkout backup && git log && git checkout -"

# merge and remove backup branch
if [ "$MERGE" = "1" ]; then
  git checkout backup >/dev/null 2>&1
  git merge --no-ff "$BACKUP_BRANCH"
  git branch -D "$BACKUP_BRANCH"
fi

git checkout master >/dev/null 2>&1
git stash pop >/dev/null 2>&1
unset GIT_{AUTHOR,COMMITTER}_NAME GIT_{AUTHOR,COMMITTER}_EMAIL
cd - >/dev/null 2>&1
echo
