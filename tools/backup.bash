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
BACKUP_BRANCH="backup/$(date +'%Y%m%d%H%M%S')"
git checkout --orphan "$BACKUP_BRANCH" >/dev/null 2>&1

# commit
git commit -m "backup dotfiles" | head -n 10
echo 'If you want to roll back, run the following command.'
echo "  \$ git -C "$DOT_DIR" checkout $BACKUP_BRANCH"

git checkout master >/dev/null 2>&1
git stash pop >/dev/null 2>&1
unset GIT_{AUTHOR,COMMITTER}_NAME GIT_{AUTHOR,COMMITTER}_EMAIL
cd - >/dev/null 2>&1
echo
