#!/bin/bash

: ${INCLUDE_GUARD:=0}

if [ "$INCLUDE_GUARD" = "0" ]; then
  has() {
    type $1 >/dev/null 2>&1
  }

  print() {
    printf "$@\n"
  }

  cprint() {
    local color="$1"
    local string="$2"
    local reset="\x1b[0m"
    print "${color}${string}${reset}"
  }

  cprintf() {
    local color="$1"
    local string="$2"
    local reset="\x1b[0m"
    printf "${color}${string}${reset}"
  }

  interval() {
    if which usleep >/dev/null 2>&1; then
      usleep 500000
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
