#!/bin/bash
restart_cygwin() {
    printf "Restarting cygwin..."
    cygstart mintty -t "Cygwin" -i /Cygwin-Terminal.ico -
    echo -e "\033[1;36mdone\033[0;39m"
}

restart_shell() {
    echo "Restarting shell..."
    exec $SHELL -l
}

restart() {
    if [ $OSTYPE = cygwin ]; then
        # Cygwin
        printf "Do you want to restart cygwin (yes/no)? "
        read ANSWER

        case $ANSWER in
            "Y" | "y" | "Yes" | "yes" )
                restart_cygwin
                ;;
            * )
                echo
                ;;
        esac
    else
        # ! Cygwin
        printf "Do you want to restart shell (yes/no)? "
        read ANSWER

        case $ANSWER in
            "Y" | "y" | "Yes" | "yes" )
                restart_shell
                ;;
            * )
                echo
                ;;
        esac
    fi
}

if [ "$ASSUME_YES" = "1" ]; then
    if [ $OSTYPE = cygwin ]; then
        restart_cygwin
    else
        restart_shell
    fi
else
    restart
fi
