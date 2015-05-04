#!/bin/bash
source ~/.dotfiles/tools/load_dotpath.bash
source ~/.dotfiles/tools/load_exdotfile.bash

# Count max
printf "Checking backup file..."

max=0
## Dotfile
for file in ${DOTPATH[@]}; do
  if [ -e ~/${file##*/} ]; then
    max=$((max + 1))
  fi
done

## Exdotfile
N=$((${#EXDOTFILE[@]} - 1))
for i in $(seq 1 $N); do
  if [ -e ~/${EXDOTFILE[$i]} ]; then
    max=$((max + 1))
  fi
done

echo -e "\033[1;36mdone\033[0;39m"

if [ ! "$max" = "0" ]; then
  # Create backup dir
  DATE=$(date +"%Y-%m-%d_%H%M%S")
  printf "Creating backup directory..."
  mkdir -p ~/.dotfiles/backup/$DATE
  echo -e "\033[1;36mdone\033[0;39m"
  # Display backup directory
  echo "Backup directory: ~/.dotfiles/backup/$DATE"

  # Start backup
  echo -e "\033[4;39mStarting backup\033[0;39m"

  i=0
  # Dotfile
  N=$((${#DOTDIR[@]} - 1))
  for j in $(seq 1 $N); do
    # File
    DOTPATH_F=$(find ~/.dotfiles/${DOTDIR[$j]} -maxdepth 1 -type f -name ".*")
    for file in ${DOTPATH_F[@]}; do
      if [ -e ~/${file##*/} ]; then
        i=$((i + 1))
        printf "[%2d/%2d] Copying: %-35s | type: %s\n" $i $max ~/${file##*/} ${DOTDIR_A[$j]}
        cp ~/${file##*/} ~/.dotfiles/backup/$DATE
      fi
    done
    # Directory
    DOTPATH_D=$(find ~/.dotfiles/${DOTDIR[$j]} -maxdepth 1 -type d -name ".*")
    for file in ${DOTPATH_D[@]}; do
      if [ -e ~/${file##*/} ]; then
        i=$((i + 1))
        printf "[%2d/%2d] Copying: %-35s | type: %s\n" $i $max ~/${file##*/} ${DOTDIR_A[$j]}
        cp -r ~/${file##*/}/ ~/.dotfiles/backup/$DATE
        if [ ! -L ~/${file##*/} -a -d ~/${file##*/} ]; then
          rm -fr ~/${file##*/}/
        fi
      fi
    done
  done

  # Exdotfile
  N=$((${#EXDOTFILE[@]} - 1))
  for j in $(seq 1 $N); do
    # File
    if [ -f ~/${EXDOTFILE[$j]} ]; then
      i=$((i + 1))
      printf "[%2d/%2d] Copying: %-35s | type: Exdotfile\n" $i $max ~/${EXDOTFILE[$j]}
      cp ~/${EXDOTFILE[$j]} ~/.dotfiles/backup/$DATE
    fi
    # Directory
    if [ -d ~/${EXDOTFILE[$j]} ]; then
      i=$((i + 1))
      printf "[%2d/%2d] Copying: %-35s | type: Exdotfile\n" $i $max ~/${EXDOTFILE[$j]}
      cp -r ~/${EXDOTFILE[$j]}/ ~/.dotfiles/backup/$DATE
      if [ ! -L ~/${EXDOTFILE[$j]} -a -d ~/${EXDOTFILE[$j]} ]; then
        rm -fr ~/${EXDOTFILE[$j]}/
      fi
    fi
  done
else
  echo -e "Backup file doesn't exist\n"
fi
