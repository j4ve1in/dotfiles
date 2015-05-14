#!/bin/bash
case "$1" in
  "-u" | "--update" )
    source ~/.dotfiles/tools/update.bash
    ;;
  "-b" | "--backup" )
    source ~/.dotfiles/tools/backup.bash
    ;;
  "-r" | "--reinstall" )
    source ~/.dotfiles/tools/reinstall.bash
    ;;
  "-U" | "--uninstall" )
    source ~/.dotfiles/tools/uninstall.bash
    ;;
  "--install-plugin" )
    source ~/.dotfiles/tools/install_plugin.bash
    ;;
  "--uninstall-plugin" )
    source ~/.dotfiles/tools/uninstall_plugin.bash
    ;;
  "-l" | "--list" )
    source ~/.dotfiles/tools/view_list.bash
    ;;
  "-m" | "--directory-map" )
    source ~/.dotfiles/tools/view_map.bash
    ;;
  "-h" | "--help" )
    source ~/.dotfiles/tools/help.bash
    ;;
  -* )
    echo "dotsetup: illegal option -- '$(echo $1 | sed 's/^-*//')'"
    echo -e "Try 'dotsetup --help' for more information.\n"
    exit 1
    ;;
  * )
    echo -e "\033[1;31mError\033[m"
    echo -e "Try 'dotsetup --help' for more information.\n"
    exit 1
    ;;
esac
