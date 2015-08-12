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
  { sleep 1; git clone ${URL[i]} ~/${DIR[i]}; } | env LESS="-cE" less
  echo -e "\033[1;36mdone\033[0;39m"
done

# Install plugin
echo -e "\033[4;39mStarting download plugin by plugin manager\033[0;39m"
## Vim
echo " Vim"
printf "  Downloading vimproc..."
{ sleep 1; git clone git://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/vimproc.vim; } | env LESS="-cE" less
echo -e "\033[1;36mdone\033[0;39m"
make -C ~/.vim/bundle/vimproc.vim >/dev/null 2>&1
printf "  Downloading other plugin..."
{ sleep 1; source ~/.vim/bundle/neobundle.vim/bin/neoinstall; } | env LESS="-cE" less
echo -e "\033[1;36mdone\033[0;39m"

## Zsh
echo " Zsh"
printf "  Downloading plugin..."
{ sleep 1; zsh ~/.zshrc.plugin.d/antigen.rc.zsh; } | env LESS="-cE" less
echo -e "\033[1;36mdone\033[0;39m"

## Tmux
echo " Tmux"
printf "  Downloading plugin..."
{ sleep 1; bash ~/.tmux/plugins/tpm/scripts/install_plugins.sh; } | env LESS="-cE" less
echo -e "\033[1;36mdone\033[0;39m"
