#!/bin/bash
cat << EOT
Usage: dotsetup [OPTIONS]
    This script is dotfile's setup command.

Options:
    -u, --update          Update dotfiles
    -b, --backup          Backup dotfiles
    -r, --reinstall       Reinstall dotfiles
    -U, --uninstall       Uninstall dotfiles
    -l, --list            View dotfile's list
    -m, --directory-map   View dotfile's directory map
    -h, --help            View help
    --install-plugin      Install shell and editor plugin
    --uninstall-plugin    Uninstall shell and editor plugin

EOT
