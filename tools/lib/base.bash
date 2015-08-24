#!/bin/bash

: ${INCLUDE_GUARD:=0}

if [ "$INCLUDE_GUARD" = "0" ]; then
  has() { type $1 >/dev/null 2>&1; }

  print() { printf "$@\n"; }

  BLUE="34"
  RED_B="1;31;49"
  CYAN_B="1;36;49"
  UNDERLINE="4;39;49"
  COLOR_75_B="1;38;5;75;49"
  COLOR_93_B="1;38;5;93;49"

  cprint() {
    local string="$1"
    local color="\x1b[${2}m"
    local reset="\x1b[0;39;49m"
    print "${color}${string}${reset}"
  }

  cprintf() {
    local string="$1"
    local color="\x1b[${2}m"
    local reset="\x1b[0;39;49m"
    printf "${color}${string}${reset}"
  }

  interval() {
    if has usleep; then
      usleep $1
    fi
  }

  source_dotool() {
    local file="$1"
    local arg="$2"
    local dotooldir="$HOME/.dotfiles/tools/"
    source ${dotooldir}${file}.bash $arg
  }

  INCLUDE_GUARD="1"
fi
