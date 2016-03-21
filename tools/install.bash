#!/bin/bash

main() {
  set_color
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
}

print_header() {
  clear
  # http://patorjk.com/software/taag/#p=display&h=1&f=Slant&t=dotfiles
  printf "\n$COLOR_32_B"
  echo '          __        __   ____ _  __              '
  echo '     ____/ /____   / /_ / __/(_)/ /___   _____   '
  echo '    / __  // __ \ / __// /_ / // // _ \ / ___/   '
  echo '   / /_/ // /_/ // /_ / __// // //  __/(__  )    '
  echo '   \__,_/ \____/ \__//_/  /_//_/ \___//____/     '
  printf "$COLOR_RESET\n"
  cprint '                   github.com/ytet5uy4/dotfiles   \n' "$DARKGRAY"
  cprintf '   Author: '  "$COLOR_75_B"; printf 'ytet5uy4'
  cprintf '   License: ' "$COLOR_75_B"; echo   'MIT'
  cprintf '   Full Installation: ' "$COLOR_75_B"
  [ "$FULL_INSTALLATION" = "1" ] && cprint 'enable' $CYAN_B || cprint 'disable' $RED_B
  cprintf '   Option Assume yes: ' "$COLOR_75_B"
  [ "$ASSUME_YES" = "1" ] && cprint 'enable' $CYAN_B || cprint 'disable' $RED_B
  echo
}

install() {
  # Start install
  cprint "Download dotfiles" $UNDERLINE
  ## Check git command
  printf " Checking git command..."
  if has git; then
    cprint "done" $CYAN_B
  else
    cprint "error" $RED_B
    echo " Please install git or update your path to include the git executable"
    exit 1;
  fi

  ## Download
  printf " Downloading dotfiles..."
  DOTFILES_REPO='https://github.com/ytet5uy4/dotfiles.git'
  { sleep 1; git clone $DOTFILES_REPO ~/.dotfiles; } | env LESS="-cE" less
  cprint "done\n" $CYAN_B

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
  cprint "done" $CYAN_B

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
      cprint "done" $CYAN_B
      if [ "$OSTYPE" = "msys" ]; then
        make -C "$VIMPROC_DIR" -f 'make_cygwin.mak' >/dev/null 2>&1
      else
        make -C "$VIMPROC_DIR" >/dev/null 2>&1
      fi

      printf "  Downloading other plugin by Dein..."
      { sleep 1; vim +qall; echo ''; } | env LESS="-cE" less
      cprint "done" $CYAN_B
    fi

    ## Zsh
    if has zsh; then
      echo " Zsh"
      printf "  Downloading plugin by Zplug..."
      zsh ~/.dotfiles/tools/install_zsh_plugin.zsh
      cprint "done" $CYAN_B
    fi

    ## Tmux
    if has tmux && [ -n "$TMUX" ]; then
      echo " Tmux"
      printf "  Downloading plugin by TPM..."
      TPM_INSTALL_SCRIPT=~/.tmux/plugins/tpm/bindings/install_plugins
      { sleep 1; $TPM_INSTALL_SCRIPT; } | env LESS="-cE" less
      cprint "done" $CYAN_B
    fi
  fi
  echo
}

has() { type $1 >/dev/null 2>&1; }

print() { printf "$@\n"; }

set_color() {
  UNDERLINE="4;39;49"
  RED_B="1;31;49"
  CYAN_B="1;36;49"
  DARKGRAY="90"
  COLOR_32_B="\x1b[1;38;5;32;49m"
  COLOR_75_B="1;38;5;75;49"
  COLOR_RESET="\x1b[0;39;49m"
}

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

main $@
