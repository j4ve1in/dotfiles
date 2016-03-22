#!/bin/bash

source ~/.dotfiles/tools/lib/base.bash
source_dotool lib/dot

main() {
  if [ "$1" != "plugin" ]; then
    [ "$ASSUME_YES" = "1" ] && uninstall && unset ASSUME_YES
    [ "$ASSUME_YES" != "1" ] && uninstall_message
    echo
  else
    uninstall_plugin; echo
  fi
}

uninstall_message() {
  printf "Are you sure you want to continue (yes/no)? "; read ANSWER
  case $ANSWER in
    "Y" | "y" | "Yes" | "yes" ) uninstall ;;
    * ) ;;
  esac
}

uninstall() {
  # Count up
  cprint "Check dotfiles" $UNDERLINE
  source_dotool lib/countup
  echo

  # Remove
  cprint "Remove dotfiles" $UNDERLINE
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
  rm -rf ~/.dotfiles ~/.zshenv.zwc
}

uninstall_plugin() {
  # Remove
  ## zsh
  rm -f ~/.zsh/bundle/.cache && ls ~/.zsh/bundle | xargs rm -rf

  ## vim
  rm -rf ~/.vim/bundle/.dein && ls ~/.vim/bundle | xargs rm -rf

  ## tmux
  ls ~/.tmux/plugins | xargs rm -rf
}

main $@
