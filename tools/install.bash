#!/bin/bash

install() {
    # Start install
    echo "Starting install"
    # check git command
    printf "Checking git command..."
    if [ $(which git) ]; then
        echo -e "\033[1;36mdone\033[0;39m"
    else
        echo
        echo "Please install git or update your path to include the git executable"
        exit 1;
    fi

    # Download
    printf "Downloading dotfiles..."
    if [ "$FULL_INSTALLATION" = "1" ]; then
        { sleep 1; git clone git://github.com/j4ve1in/dotfiles.git ~/.dotfiles; } | env LESS="-cE" less
        source ~/.dotfiles/tools/install_plugin.bash
        unset FULL_INSTALLATION
    else
        { sleep 1; git clone git://github.com/j4ve1in/dotfiles.git ~/.dotfiles; } | env LESS="-cE" less
    fi
    echo -e "\033[1;36mdone\033[0;39m"

    # backup
    source ~/.dotfiles/tools/backup.bash

    # create symbolic link
    source ~/.dotfiles/tools/create_symlink.bash

    Color="\033[1;36;44m"
    Color_Reset="\033[0;39m"
    echo -e ${Color}'     ____           __        ____   ______                      __     __      '${Color_Reset}
    echo -e ${Color}'    /  _/___  _____/ /_____ _/ / /  / ____/___  ____ ___  ____  / /__  / /____  '${Color_Reset}
    echo -e ${Color}'    / // __ \/ ___/ __/ __ `/ / /  / /   / __ \/ __ `__ \/ __ \/ / _ \/ __/ _ \ '${Color_Reset}
    echo -e ${Color}'  _/ // / / (__  ) /_/ /_/ / / /  / /___/ /_/ / / / / / / /_/ / /  __/ /_/  __/ '${Color_Reset}
    echo -e ${Color}' /___/_/ /_/____/\__/\__,_/_/_/   \____/\____/_/ /_/ /_/ .___/_/\___/\__/\___/  '${Color_Reset}
    echo -e ${Color}'                                                      /_/                       '${Color_Reset}
    echo -e ${Color}" Follow me at https://github.com/j4ve1in                                        "${Color_Reset}
    echo
    #http://patorjk.com/software/taag/#p=display&f=Slant&t=Install%20Complete
}

if [ "$ASSUME_YES" = "1" ]; then
    # Assume "yes" as answer to all prompts and run non-interactively.
    # install
    install
    # restart
    source ~/.dotfiles/tools/restart.bash
    unset ASSUME_YES
else
    clear
    echo "If the file exists, it will be ruthlessly clobbered"
    printf "Are you sure you want to continue (yes/no)? "
    read ANSWER

    case $ANSWER in
        "Y" | "y" | "Yes" | "yes" )
            # install
            install
            # restart
            source ~/.dotfiles/tools/restart.bash
            exit 0
            ;;
        * )
            echo
            exit 0
            ;;
    esac
fi
