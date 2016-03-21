#!/bin/bash

source ~/.dotfiles/tools/lib/base.bash
source_dotool lib/dot

# Count max
cprint "Check backup file" $UNDERLINE
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
  cprint "Start backup" $UNDERLINE
  printf " \`dotfiles' "
  cprintf "->" $COLOR_93_B
  echo " \`~/.dotfiles/backup/$DATE'"
  N=${#DOT_NAME[@]}
  j=1
  for ((i=0;i<N;i++)); do
    if [ -f ~/${DOT_NAME[$i]} ] || [ -d ~/${DOT_NAME[$i]} ]; then
      cprintf " [" $BLUE
      printf "%2d/%2d" $j $MAX
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
      ((j++))
    fi
  done
else
  echo " Backup file doesn't exist"
fi

echo
interval 500000
