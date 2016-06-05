#!/bin/bash

main() {
  check_opt $@
  set_color_var
  [ "$PLUGIN_INSTALLATION" = "1" ] && install_plugin; exit 0
  print_header
  install
}

check_opt() {
  while (( $# > 0 )); do
    case "$1" in
      -*)
        [[ "$1" =~ 'f' ]] && readonly FULL_INSTALLATION='1'
        [[ "$1" =~ 'y' ]] && readonly ASSUME_YES='1'
        [[ "$1" =~ 'p' ]] && readonly PLUGIN_INSTALLATION='1'
        shift
        ;;
      *) shift ;;
    esac
  done
}

set_color_code() { echo "\e[${1}m"; }

set_color_var() {
  MAIN_COLOR="$(set_color_code '1;38;5;32;49')"
  SUB_COLOR="$(set_color_code '1;38;5;75;49')"
  SUCCESS_COLOR="$(set_color_code '1;36;49')"
  ERROR_COLOR="$(set_color_code '1;31;49')"
  UNDERLINE="$(set_color_code '4;39;49')"
  DARKGRAY="$(set_color_code '90')"
  COLOR_RESET="$(set_color_code '0;39;49')"
}

print_header() {
  clear
  printf "\n$MAIN_COLOR"
  echo '          __        __   ____ __ __              '
  echo '     ____/ /____   / /_ / __//_// /___   _____   '
  echo '    / __  // __ \ / __// /_ / // // _ \ / ___/   '
  echo '   / /_/ // /_/ // /_ / __// // //  __//__  /    '
  echo '   \__,_/ \____/ \__//_/  /_//_/ \___//____/     '
  printf "$COLOR_RESET\n"
  cprint '                   github.com/ytet5uy4/dotfiles   \n' "$DARKGRAY"
  cprintf '   Author: '  "$SUB_COLOR"; printf 'ytet5uy4'
  cprintf '   License: ' "$SUB_COLOR"; echo   'MIT'
  cprintf '   Full Installation: ' "$SUB_COLOR"
  [ "$FULL_INSTALLATION" = "1" ] && cprint 'enable' "$MAIN_COLOR" || print 'disable'
  cprintf '   Option Assume yes: ' "$SUB_COLOR"
  [ "$ASSUME_YES" = "1" ] && cprint 'enable' "$MAIN_COLOR" || print 'disable'
  echo
  [ "$ASSUME_YES" != "1" ] && warning
}

warning() {
  echo '   If the file exists, it will be ruthlessly clobbered'
  printf '   Are you sure you want to continue (yes/no)? '
  read -s -n 1 ANSWER; echo -e '\n'
  case $ANSWER in
    'Y' | 'y' ) install ;;
    * ) exit 0 ;;
  esac
}

install() {
  # Download
  download

  # Backup
  . ~/.dotfiles/tools/backup.bash

  # Deploy
  . ~/.dotfiles/tools/deploy.bash

  # Install plugin
  [ "$FULL_INSTALLATION" = "1" ] && install_plugin

  # Restart
  [ "$ASSUME_YES" = "1" ] && restart || restart_message
}

download() {
  cprint "Download dotfiles" $UNDERLINE
  if lprintf ' Checking git command' 'type git'; then
    cprintf '  Use: ' "$SUB_COLOR"
    type -a git | tail -n 1 | awk '{print $3}'
  else
    echo ' Please install git or update your path to run git command'
    exit 1;
  fi

  local readonly DOTFILES_REPO='https://github.com/ytet5uy4/dotfiles.git'
  lprintf ' Downloading dotfiles' "git clone $DOTFILES_REPO ${HOME}/.dotfiles"
  echo
}

restart_message() {
  printf "Do you want to restart shell (yes/no)? "
  read -s -n 1 ANSWER; echo -e '\n'
  case $ANSWER in
    "Y" | "y" ) restart ;;
    * ) exit 0 ;;
  esac
}

restart() { clear; exec $SHELL -l; }

install_plugin() {
  cprint "Install plugin" $UNDERLINE

  local readonly NAME=('Dein' 'Zplug' 'TPM')

  lprintf " Downloading ${NAME[*]}" 'download_plugin'
  echo
}

download_plugin() {
  local readonly REPO=('Shougo/dein.vim' 'b4b4r07/zplug' 'tmux-plugins/tpm')
  local readonly GITHUB_URL='https://github.com/'
  local readonly DIR=(
    '.vim/bundle/repos/github.com/Shougo/dein.vim'
    '.zsh/bundle/zplug'
    '.tmux/plugins/tpm'
  )
  paste -d ' ' <(printf "%s\n" "${REPO[@]}") <(printf "%s\n" "${DIR[@]}") \
    | sed -e "s|^|${GITHUB_URL}|g" \
    | xargs -L 1 -n 2 -P "${#REPO[*]}" git clone >/dev/null 2>&1
}

print() { printf "$@\n"; }

cprint() { print "${2}${1}${COLOR_RESET}"; }

cprintf() { printf "${2}${1}${COLOR_RESET}"; }

lprintf() {
  local readonly MSG="$1" CMD="${@:2}"
  $CMD >/dev/null 2>&1 &
  while :; do
    jobs %1 > /dev/null 2>&1 || break
    printf "\r%s${MAIN_COLOR}%s${COLOR_RESET}" "${MSG}" ".  "
    sleep 0.7
    jobs %1 > /dev/null 2>&1 || break
    printf "\r%s%s${MAIN_COLOR}%s${COLOR_RESET}" "${MSG}" "." ". "
    sleep 0.7
    jobs %1 > /dev/null 2>&1 || break
    printf "\r%s%s${MAIN_COLOR}%s${COLOR_RESET}" "${MSG}" ".." "."
    sleep 0.7
  done
  if wait $!; then
    printf "\r${MSG}..."
    cprint 'done' "$SUCCESS_COLOR"
    return 0
  else
    printf "\r${MSG}..."
    cprint 'error' "$ERROR_COLOR"
    return 1
  fi
}

main $@
