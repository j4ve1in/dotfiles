#!/bin/bash

# Start download plugin manager
echo -e "\033[4;39mStarting download plugin manager\033[0;39m"

CSV_FILE=~/.dotfiles/tools/plugin-manager.csv
declare -a NAME=($(cat $CSV_FILE | cut -d ',' -f 1 | sed -e 's/"//g' -e '1d'))
declare -a URL=($(cat $CSV_FILE | cut -d ',' -f 2 | sed -e 's/"//g' -e '1d'))
declare -a DIR=($(cat $CSV_FILE | cut -d ',' -f 3 | sed -e 's/"//g' -e '1d'))
declare -i N=${#NAME[@]}

for ((i=0;i<N;i++)); do
  printf " Downloading ${NAME[i]}..."
  { sleep 1; git clone ${URL[i]} ${DIR[i]}; } | env LESS="-cE" less
  echo -e "\033[1;36mdone\033[0;39m"
done
