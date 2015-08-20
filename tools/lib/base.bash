#!/bin/bash

has() {
  type $1 >/dev/null 2>&1
}

cprintf() {
  local color="$1"
  local string="$2"
  local reset="\x1b[0m"
  printf "${color}${string}${reset}"
}

source_dotool() {
  local file="$1"
  local arg="$2"
  local dotooldir="$HOME/.dotfiles/tools/"
  source ${dotooldir}${file}.bash $arg
}
