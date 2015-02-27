#!/bin/bash
install() {
    INSTALL_DIR=~/.dotfiles

    # check git command
    printf "Checking git command..."
    if [ $(which git) ]; then
        echo -e "\033[1;36mdone\033[0;39m"
    else
        echo
        echo "Please install git or update your path to include the git executable"
        exit 1;
    fi

    # clone
    printf "Cloning dotfiles..."
    git clone git://github.com/tetsuya00/dotfiles.git ${INSTALL_DIR} --recursive >/dev/null 2>&1
    echo -e "\033[1;36mdone\033[0;39m"

    # backup
    source ~/.dotfiles/tools/backup.bash

    # create symbolic link
    source ~/.dotfiles/tools/create_symlink.bash

    # Vim
    # check vim command
    printf "Checking vim command..."
    if [ $(which vim) ]; then
        echo -e "\033[1;36mdone\033[0;39m"
        echo "Vim Setting"
        printf "Creating directory..."
        mkdir -p ~/.vim/tmp/swap
        mkdir -p ~/.vim/tmp/backup
        mkdir -p ~/.vim/tmp/undo
        echo -e "\033[1;36mdone\033[0;39m"
        echo -e "Installing plugin\n"
        vim +NeoBundleInstall +qall
    else
        echo
        echo "Please install vim or update your path to include the vim executable"
    fi

    printf "Deploying dotsetup..."
    mkdir -p ~/bin
    chmod a+x ~/.dotfiles/tools/setup.bash
    cp ~/.dotfiles/tools/setup.bash ~/bin/dotsetup
    echo -e "\033[1;36mdone\033[0;39m"

    Color="\033[1;36;44m"
    Color_Reset="\033[0;39m"
    echo -e ${Color}'     ____           __        ____   ______                      __     __      '${Color_Reset}
    echo -e ${Color}'    /  _/___  _____/ /_____ _/ / /  / ____/___  ____ ___  ____  / /__  / /____  '${Color_Reset}
    echo -e ${Color}'    / // __ \/ ___/ __/ __ `/ / /  / /   / __ \/ __ `__ \/ __ \/ / _ \/ __/ _ \ '${Color_Reset}
    echo -e ${Color}'  _/ // / / (__  ) /_/ /_/ / / /  / /___/ /_/ / / / / / / /_/ / /  __/ /_/  __/ '${Color_Reset}
    echo -e ${Color}' /___/_/ /_/____/\__/\__,_/_/_/   \____/\____/_/ /_/ /_/ .___/_/\___/\__/\___/  '${Color_Reset}
    echo -e ${Color}'                                                      /_/                       '${Color_Reset}
    echo -e ${Color}" Follow me at https://github.com/tetsuya00                                      "${Color_Reset}
    echo
    #http://patorjk.com/software/taag/#p=display&f=Slant&t=Install%20Complete
}

if [ "$DOTFILES_REINSTALL" = "1" ]; then
    install
else
    echo "If the file exists, it will be ruthlessly clobbered"
    printf "Are you sure you want to continue (yes/no)? "
    read ANSWER

    case $ANSWER in
        "Y" | "y" | "Yes" | "yes" )
            install
            exit 0
            ;;
        * )
            echo
            exit 0
            ;;
    esac
fi
