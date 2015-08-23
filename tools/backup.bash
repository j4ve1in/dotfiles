#!/bin/bash

source ~/.dotfiles/tools/lib/base.bash
source_dotool lib/create_data

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
  cprintf "->" $BLUE
  echo " \`~/.dotfiles/backup/$DATE'"

  COUNT=0
  ## Dotfile
  N=${#DOT_NAME[@]}
  for ((i=0;i<N;i++)); do
    if [ -f ~/${DOT_NAME[$i]} ]; then
      cprintf " [" $BLUE
      printf "%2d/%2d" $((COUNT+1)) $MAX
      cprintf "] " $BLUE
      cprintf "Copying:" $COLOR_75_B
      printf " %s\n" ~/${DOT_NAME[$i]}
      cp ~/${DOT_NAME[$i]} ~/.dotfiles/backup/$DATE
      ((COUNT=COUNT+1))
    elif [ -d ~/${DOT_NAME[$i]} ]; then
      cprintf " [" $BLUE
      printf "%2d/%2d" $((COUNT+1)) $MAX
      cprintf "] " $BLUE
      cprintf "Copying:" $COLOR_75_B
      printf " %s\n" ~/${DOT_NAME[$i]}
      cp -r ~/${DOT_NAME[$i]}/ ~/.dotfiles/backup/$DATE
      if [ ! -L ~/${DOT_NAME[$i]} -a -d ~/${DOT_NAME[$i]} ]; then
        rm -fr ~/${DOT_NAME[$i]}/
      fi
      ((COUNT=COUNT+1))
    fi
  done
else
  echo " Backup file doesn't exist"
fi

echo
interval 500000
