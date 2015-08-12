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
    source ~/.dotfiles/tools/install.bash plugin
    ;;
  "--uninstall-plugin" )
    source ~/.dotfiles/tools/uninstall_plugin.bash
    ;;
  "-l" | "--list" )
    source ~/.dotfiles/tools/list.bash
    ;;
  "-m" | "--directory-map" )
    source ~/.dotfiles/tools/map.bash
    ;;
  "-h" | "--help" )
    echo "Usage: dotsetup [OPTIONS]                                  "
    echo "    This script is dotfile's setup command.                "
    echo "                                                           "
    echo "Options:                                                   "
    echo "    -u, --update          Update dotfiles                  "
    echo "    -b, --backup          Backup dotfiles                  "
    echo "    -r, --reinstall       Reinstall dotfiles               "
    echo "    -U, --uninstall       Uninstall dotfiles               "
    echo "    -l, --list            View dotfile's list              "
    echo "    -m, --directory-map   View dotfile's directory map     "
    echo "    -h, --help            View help                        "
    echo "    --install-plugin      Install shell and editor plugin  "
    echo "    --uninstall-plugin    Uninstall shell and editor plugin"
    echo "                                                           "
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
