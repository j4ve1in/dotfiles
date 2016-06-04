#!/bin/bash

. ~/.dotfiles/tools/lib/base.bash

display_advice() { echo -e "Try 'dotsetup --help' for more information.\n"; }

case "$1" in
  "-u" | "--update" ) source_dotool update ;;
  "-d" | "--deploy" ) source_dotool deploy ;;
  "-b" | "--backup" ) source_dotool backup ;;
  "-r" | "--reinstall" ) source_dotool reinstall ;;
  "-U" | "--uninstall" ) source_dotool uninstall ;;
  "-p" | "--install-plugin" ) source_dotool install -p ;;
  "-P" | "--uninstall-plugin" ) source_dotool uninstall -P ;;
  "-l" | "--list" ) source_dotool list ;;
  "-h" | "--help" )
    echo "Usage: dotsetup [OPTIONS]                                             "
    echo "    This script is dotfile's setup command.                           "
    echo "                                                                      "
    echo "Options:                                                              "
    echo "    -u, --update             Backup and download dotfiles             "
    echo "    -d, --deploy             Deploy dotfiles to home directory        "
    echo "    -b, --backup             Backup dotfiles to backup branch         "
    echo "    -r, --reinstall          Install dotfiles again after uninstalling"
    echo "    -U, --uninstall          Uninstall dotfiles                       "
    echo "    -l, --list               View dotfile's list                      "
    echo "    -h, --help               View help                                "
    echo "    -p, --install-plugin     Install vim, zsh and tmux plugin         "
    echo "    -P, --uninstall-plugin   Uninstall vim, zsh and tmux plugin       "
    echo "                                                                      "
    ;;
  -* )
    echo "dotsetup: illegal option -- '$(echo $1 | sed 's/^-*//')'"
    display_advice
    exit 1
    ;;
  * )
    echo "dotsetup: illegal argument -- $(echo $1)"
    display_advice
    exit 1
    ;;
esac
