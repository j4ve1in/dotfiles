#!/bin/bash

source ~/.dotfiles/tools/lib/base.bash

readonly COMMANDS=(
  "wget"
  "curl"
  "emacs"
  "vim"
  "gvim"
  "atom"
  "nano"
  "git"
  "screen"
  "tmux"
  "dircolors"
  "urxvt256c-ml"
  "xterm"
  "zsh"
  "bash"
)

main() {
  check_status
}

check_status() {
  local readonly RED="\x1b[1;31m"
  local readonly GREEN="\x1b[1;32m"
  local readonly MAX_LENGTH="$(check_maxlength)"
  local readonly N="${#COMMANDS[@]}"
  for ((i=0;i<N;i++)); do
    printf "%-$((${MAX_LENGTH}+3))s: " ${COMMANDS[$i]}
    if has ${COMMANDS[$i]}; then
      cprintf "Active\n" $GREEN
    else
      cprintf "Not found\n" $RED
    fi
  done
  echo
}

check_maxlength() {
  local MAX=0
  local readonly N=${#COMMANDS[@]}
  for ((i=0;i<N;i++)); do
    if [ "${#COMMANDS[$i]}" -gt "$MAX" ] ; then
      MAX=${#COMMANDS[$i]}
    fi
  done
  echo "$MAX"
}

main
