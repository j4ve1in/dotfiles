#!/bin/bash
menu() {
    PS3="> "
    ans1="Update"
    ans2="Backup"
    ans3="Deploy"
    ans4="Reinstall"
    ans5="Uninstall"
    ans6="Help"
    ans7="Exit"

    echo "Menu"
    select ANS in "$ans1" "$ans2" "$ans3" "$ans4" "$ans5" "$ans6" "$ans7"; do
        echo
        case $REPLY in
            1 )
                source ~/.dotfiles/Tools/update.bash
                ;;
            2 )
                source ~/.dotfiles/Tools/backup.bash
                exit 0
                ;;
            3 )
                source ~/.dotfiles/Tools/deploy.bash
                ;;
            4 )
                source ~/.dotfiles/Tools/reinstall.bash
                ;;
            5 )
                source ~/.dotfiles/Tools/uninstall.bash
                ;;
            6 )
                source ~/.dotfiles/Tools/help.bash
                menu
                ;;
            7 )
                echo -e "exit\n"
                exit 0
                ;;
            * )
                echo -e "\033[1;31mError\033[m"
                menu
                ;;
        esac
    done
}

case "$1" in
    "-u" | "--update" )
        source ~/.dotfiles/Tools/update.bash
        ;;
    "-b" | "--backup" )
        source ~/.dotfiles/Tools/backup.bash
        exit 0
        ;;
    "-d" | "--deploy" )
        source ~/.dotfiles/Tools/deploy.bash
        ;;
    "-r" | "--reinstall" )
        source ~/.dotfiles/Tools/reinstall.bash
        ;;
    "-U" | "--uninstall" )
        source ~/.dotfiles/Tools/uninstall.bash
        ;;
    "-h" | "--help" )
        source ~/.dotfiles/Tools/help.bash
        ;;
    "" )
        menu
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
