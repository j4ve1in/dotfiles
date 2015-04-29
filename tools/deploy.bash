#!/bin/bash
source ~/.dotfiles/tools/load_dotpath.bash

echo -e "\033[4;39mStart creating symbolic link\033[0;39m"

# Count max
max=0
for file in ${DOTPATH[@]}; do
  max=$((max + 1))
done

# Create
i=0
N=$((${#DOTDIR[@]} - 1))
for j in $(seq 1 $N); do
  # File
  DOTPATH_F=$(find ~/.dotfiles/${DOTDIR[$j]} -maxdepth 1 -type f -name ".*")
  for file in ${DOTPATH_F[@]}; do
    i=$((i + 1))
    printf "[%2d/%2d] Creating symlink: %-35s | type: %s\n" $i $max ~/${file##*/} ${DOTDIR_A[$j]}
    ln -sf ${file} ~/${file##*/}
  done
  # Directory
  DOTPATH_D=$(find ~/.dotfiles/${DOTDIR[$j]} -maxdepth 1 -type d -name ".*")
  for file in ${DOTPATH_D[@]}; do
    i=$((i + 1))
    printf "[%2d/%2d] Creating symlink: %-35s | type: %s\n" $i $max ~/${file##*/} ${DOTDIR_A[$j]}
    ln -sf ${file} ~
  done
done

echo
