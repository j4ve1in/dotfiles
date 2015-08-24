#!/bin/bash

source ~/.dotfiles/tools/lib/base.bash
source_dotool lib/dot

main() {
  if [ "$1" != "plugin" ]; then
    : ${ASSUME_YES:=0}
    if [ "$ASSUME_YES" = "1" ]; then
      uninstall
      unset ASSUME_YES
    else
      printf "Are you sure you want to continue (yes/no)? "; read ANSWER
      case $ANSWER in
        "Y" | "y" | "Yes" | "yes" )
          uninstall
          ;;
        * )
          ;;
      esac
    fi
    echo
  else
    uninstall_plugin; echo
  fi
}

uninstall() {
  # Count max
  cprint "Checking file" $UNDERLINE
  source_dotool lib/countup
  echo

  # Start uninstall
  cprint "Starting uninstall" $UNDERLINE

  # Remove
  ## dotfiles
  N=${#DOT_NAME[@]}
  for ((i=0;i<N;i++)); do
    if [ -e ~/${DOT_NAME[$i]} ]; then
      cprintf " [" $BLUE
      printf "%2d/%2d" $((i+1)) $MAX
      cprintf "] " $BLUE
      cprintf "Removing:" $COLOR_75_B
      printf " %s\n" ~/${DOT_NAME[$i]}
      unlink ~/${DOT_NAME[$i]}
    fi
  done

  ## dotfiles directory
  rm -rf ~/.dotfiles
}

uninstall_plugin() {
  # Remove
  ## Zsh
  ### Antigen
  rm -rf ~/.zsh/bundle/antigen
  ### Others
  rm -rf ~/.zsh/bundle/repos
  rm -f ~/.zsh/bundle/revert-info

  ## Vim
  ### NeoBundle
  rm -rf ~/.vim/bundle/.neobundle
  ### Others
  ls ~/.vim/bundle | xargs rm -rf

  ## Tmux
  ls ~/.tmux/plugins | xargs rm -rf
}

main $@
