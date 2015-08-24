#!/bin/bash

source ~/.dotfiles/tools/lib/base.bash
source_dotool lib/dot

# Count max
cprint "Checking backup file" $UNDERLINE
source_dotool lib/countup

if [ "$MAX" != "0" ]; then
  # Create backup dir
  DATE=$(date +"%Y-%m-%d_%H%M%S")
  printf " Creating backup directory..."
  mkdir -p ~/.dotfiles/backup/$DATE
  cprint "done" $CYAN_B

  # Display backup directory
  cprintf "  Backup directory:" $COLOR_75_B; echo " ~/.dotfiles/backup/$DATE"
  echo

  # Start backup
  cprint "Starting backup" $UNDERLINE
  printf " \`dotfiles' "
  cprintf "->" $COLOR_93_B
  echo " \`~/.dotfiles/backup/$DATE'"
  N=${#DOT_NAME[@]}
  for ((i=0;i<N;i++)); do
    cprintf " [" $BLUE
    printf "%2d/%2d" $((i+1)) $MAX
    cprintf "] " $BLUE
    cprintf "Copying:" $COLOR_75_B
    printf " %s\n" ~/${DOT_NAME[$i]}
    if [ -f ~/${DOT_NAME[$i]} ]; then
      cp ~/${DOT_NAME[$i]} ~/.dotfiles/backup/$DATE
    elif [ -d ~/${DOT_NAME[$i]} ]; then
      cp -r ~/${DOT_NAME[$i]}/ ~/.dotfiles/backup/$DATE
      if [ ! -L ~/${DOT_NAME[$i]} -a -d ~/${DOT_NAME[$i]} ]; then
        rm -fr ~/${DOT_NAME[$i]}/
      fi
    fi
  done
else
  echo " Backup file doesn't exist"
fi

echo
interval 500000
