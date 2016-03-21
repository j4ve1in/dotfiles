#!/bin/bash

main() {
  set_color_var
  if [ "$1" != "plugin" ]; then
    print_header
    if [ "$ASSUME_YES" = "1" ]; then
      # Assume "yes" as answer to all prompts and run non-interactively.
      install
      unset ASSUME_YES
    else
      echo '   If the file exists, it will be ruthlessly clobbered'
      printf '   Are you sure you want to continue (yes/no)? '; read ANSWER; echo
      case $ANSWER in
        "Y" | "y" | "Yes" | "yes" ) install ;;
        * ) ;;
      esac
    fi
  else
    install_plugin
  fi
  unset_color_var
}

print_header() {
  clear
  # http://patorjk.com/software/taag/#p=display&h=1&f=Slant&t=dotfiles
  printf "\n$MAIN_COLOR"
  echo '          __        __   ____ _  __              '
  echo '     ____/ /____   / /_ / __/(_)/ /___   _____   '
  echo '    / __  // __ \ / __// /_ / // // _ \ / ___/   '
  echo '   / /_/ // /_/ // /_ / __// // //  __/(__  )    '
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
}

install() {
  # Start install
  cprint "Download dotfiles" $UNDERLINE
  ## Check git command
  printf " Checking git command..."
  if has git; then
    cprint "done" $SUCCESS_COLOR
  else
    cprint "error" $ERROR_COLOR
    echo " Please install git or update your path to include the git executable"
    exit 1;
  fi

  ## Download
  printf " Downloading dotfiles..."
  DOTFILES_REPO='https://github.com/ytet5uy4/dotfiles.git'
  { sleep 1; git clone $DOTFILES_REPO ~/.dotfiles; } | env LESS="-cE" less
  cprint "done\n" $SUCCESS_COLOR

  # Backup
  source ~/.dotfiles/tools/backup.bash

  # Deploy
  source ~/.dotfiles/tools/deploy.bash

  # Install plugin
  if [ "$FULL_INSTALLATION" = "1" ]; then
    install_plugin
    unset FULL_INSTALLATION
  fi

  # Restart
  source ~/.dotfiles/tools/restart.bash
}

install_plugin() {
  cprint "Install plugin" $UNDERLINE

  local readonly NAME=('Dein' 'Zplug' 'TPM')
  local readonly REPO=('Shougo/dein.vim' 'b4b4r07/zplug' 'tmux-plugins/tpm')
  local readonly DIR=(
    '.vim/bundle/repos/github.com/Shougo/dein.vim'
    '.zsh/bundle/zplug'
    '.tmux/plugins/tpm'
  )
  local readonly N=${#NAME[@]}

  printf " Download plugin manager..."
  {
    sleep 1
    for ((i=0;i<N;i++)); do
      cprint "Download ${NAME[i]}" $UNDERLINE
      url=https://github.com/${REPO[i]}
      git clone $url ~/${DIR[i]}
      echo
    done
  } | env LESS="-cE" less
  cprint "done" $SUCCESS_COLOR
  echo

  # Install plugin
  if has vim && has zsh && has tmux; then
    cprint " Install plugin by plugin manager" $UNDERLINE
    ## Vim
    if has vim; then
      echo " Vim"

      printf "  Downloading vimproc..."
      VIMPROC_REPO='https://github.com/Shougo/vimproc.vim.git'
      VIMPROC_DIR="${HOME}/.vim/bundle/repos/github.com/Shougo/vimproc.vim"
      { sleep 1; git clone $VIMPROC_REPO $VIMPROC_DIR; } | env LESS="-cE" less
      cprint "done" $SUCCESS_COLOR
      if [ "$OSTYPE" = "msys" ]; then
        make -C "$VIMPROC_DIR" -f 'make_cygwin.mak' >/dev/null 2>&1
      else
        make -C "$VIMPROC_DIR" >/dev/null 2>&1
      fi

      printf "  Downloading other plugin by Dein..."
      { sleep 1; vim +qall; echo ''; } | env LESS="-cE" less
      cprint "done" $SUCCESS_COLOR
    fi

    ## Zsh
    if has zsh; then
      echo " Zsh"
      printf "  Downloading plugin by Zplug..."
      zsh ~/.dotfiles/tools/install_zsh_plugin.zsh
      cprint "done" $SUCCESS_COLOR
    fi

    ## Tmux
    if has tmux && [ -n "$TMUX" ]; then
      echo " Tmux"
      printf "  Downloading plugin by TPM..."
      TPM_INSTALL_SCRIPT=~/.tmux/plugins/tpm/bindings/install_plugins
      { sleep 1; $TPM_INSTALL_SCRIPT; } | env LESS="-cE" less
      cprint "done" $SUCCESS_COLOR
    fi
  fi
  echo
}

has() { type $1 >/dev/null 2>&1; }

print() { printf "$@\n"; }

set_color_code() { echo "\x1b[${1}m"; }

set_color_var() {
  MAIN_COLOR="$(set_color_code '1;38;5;32;49')"
  SUB_COLOR="$(set_color_code '1;38;5;75;49')"
  SUCCESS_COLOR="$(set_color_code '1;36;49')"
  ERROR_COLOR="$(set_color_code '1;31;49')"
  UNDERLINE="$(set_color_code '4;39;49')"
  DARKGRAY="$(set_color_code '90')"
  COLOR_RESET="$(set_color_code '0;39;49')"
}

unset_color_var() {
  unset MAIN_COLOR SUB_COLOR
  unset SUCCESS_COLOR ERROR_COLOR
  unset UNDERLINE
  unset DARKGRAY
  unset COLOR_RESET
}

cprint() { print "${2}${1}${COLOR_RESET}"; }

cprintf() { printf "${2}${1}${COLOR_RESET}"; }

main $@
