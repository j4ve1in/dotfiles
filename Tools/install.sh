#!/bin/bash
install() {
    INSTALL_DIR=~/.dotfiles
    if [ -e ${INSTALL_DIR} ]; then
        echo "${INSTALL_DIR} already exists"
        exit 1
    fi
    
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
    bash ~/.dotfiles/Tools/backup.sh

    # create symbolic link
    bash ~/.dotfiles/Tools/create_symlink.sh

    # Vim
    echo "Vim Setting"
    printf "Creating directory..."
    mkdir -p ~/.vim/tmp/swap
    mkdir -p ~/.vim/tmp/backup
    mkdir -p ~/.vim/tmp/undo
    echo -e "\e[1;34mdone\e[m"
    echo "Installing neobundle.vim..."
    mkdir -p ~/.vim/bundle
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
    printf "Installing plugin..."
    vim +NeoBundleInstall +qall
    echo -e "\e[1;34mdone\e[m"

    # Zsh
    echo "Zsh Setting"
    printf "Creating directory..."
    mkdir -p ~/.zsh/plugins
    echo -e "\e[1;34mdone\e[m"

    #printf "設定用コマンドdotsetupを追加しますか (yes/no)? "
    printf "Do you want to use dotsetup command (yes/no)? "
    read ANSWER

    ANSWER=$(echo $ANSWER | tr y Y | tr -d '[\[\]]')
    case $ANSWER in
        ""|Y* )
            if [ $USER = "root" ] || [ $OSTYPE = "cygwin" ]; then
                chmod a+x ~/.dotfiles/Tools/setup.sh
                cp -f ~/.dotfiles/Tools/setup.sh /usr/local/bin/dotsetup
            else
                INSTALL_USER=${USER}
                #echo "rootユーザーのパスワードを入力してください"
                printf "root Password: "
                su -c "cp -f /home/${INSTALL_USER}/.dotfiles/Tools/setup.sh /usr/local/bin/dotsetup ; exit"
            fi
            echo -e "Deployed dotsetup\n"
            ;;
        *  )
            echo
            ;;
    esac

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
}

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
