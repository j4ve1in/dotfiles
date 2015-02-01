#!/bin/bash
install() {
    INSTALL_DIR=~/.dotfiles
    
    # check git command
    printf "Checking git command..."
    if [ $(which git) ]; then
        echo -e "\e[1;34mdone\e[m"
    else
        echo
        echo "Please install git or update your path to include the git executable"
        exit 1;
    fi

    # clone
    printf "Cloning dotfiles..."
    git clone https://github.com/tetsuya00/Dotfiles.git ${INSTALL_DIR} >/dev/null 2>&1
    echo -e "\e[1;34mdone\e[m"

    # backup
    source ~/.dotfiles/Tools/backup.sh

    # create symbolic link
    source ~/.dotfiles/Tools/create_symlink.sh

    # Vim
    # check vim command
    printf "Checking vim command..."
    if [ $(which vim) ]; then
        echo -e "\e[1;34mdone\e[m"
        echo "Vim Setting"
        printf "Creating directory..."
        mkdir -p ~/.vim/tmp/swap
        mkdir -p ~/.vim/tmp/backup
        mkdir -p ~/.vim/tmp/undo
        echo -e "\e[1;34mdone\e[m"
        printf "Installing neobundle.vim..."
        git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim >/dev/null 2>&1
        echo -e "\e[1;34mdone\e[m"
        echo -e "Installing plugin\n"
        vim +NeoBundleInstall +qall
    else
        echo
        echo "Please install vim or update your path to include the vim executable"
    fi

    # Zsh
    # check zsh command
    printf "Checking zsh command..."
    if [ $(which vim) ]; then
        echo -e "\e[1;34mdone\e[m"
        echo "Zsh Setting"
        printf "Creating directory..."
        mkdir -p ~/.zsh/plugins
        echo -e "\e[1;34mdone\e[m\n"
    else
        echo
        echo "Please install zsh or update your path to include the zsh executable"
    fi

    printf "Deploying dotsetup..."
    mkdir -p ~/bin
    chmod a+x ~/.dotfiles/Tools/setup.sh
    ln -sf ~/.dotfiles/Tools/setup.sh ~/bin/dotsetup
    echo -e "\e[1;34mdone\e[m\n\n"

    Color="\e[1;36;44m"
    Color_Reset="\e[m"
    echo -e ${Color}'     ____           __        ____   ______                      __     __      '${Color_Reset}
    echo -e ${Color}'    /  _/___  _____/ /_____ _/ / /  / ____/___  ____ ___  ____  / /__  / /____  '${Color_Reset}
    echo -e ${Color}'    / // __ \/ ___/ __/ __ `/ / /  / /   / __ \/ __ `__ \/ __ \/ / _ \/ __/ _ \ '${Color_Reset}
    echo -e ${Color}'  _/ // / / (__  ) /_/ /_/ / / /  / /___/ /_/ / / / / / / /_/ / /  __/ /_/  __/ '${Color_Reset}
    echo -e ${Color}' /___/_/ /_/____/\__/\__,_/_/_/   \____/\____/_/ /_/ /_/ .___/_/\___/\__/\___/  '${Color_Reset}
    echo -e ${Color}'                                                      /_/                       '${Color_Reset}
    echo -e ${Color}" Follow me at https://github.com/tetsuya00                                      "${Color_Reset}
    echo
    #http://patorjk.com/software/taag/#p=display&f=Slant&t=Install%20Complete

    exec $SHELL -l
}
export TERM=xterm-256color

if [ "$DOTFILES_REINSTALL" = "1" ]; then
    install
else
    #echo "インストールすると設定が上書きされます。"
    echo "If the file exists, it will be ruthlessly clobbered"
    #printf "本当にインストールしてもよろしいですか？[Y/n]: "
    printf "Are you sure you want to continue (yes/no)? "
    read ANSWER

    ANSWER=$(echo $ANSWER | tr y Y | tr -d '[\[\]]')
    case $ANSWER in
        ""|Y* )
            install
            ;;
        *  )
            echo
            ;;
    esac
fi
