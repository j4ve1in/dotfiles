#!/bin/bash
restart_cygwin() {
    echo "Restarting cygwin..."
    cygstart mintty -t "Cygwin" -i /Cygwin-Terminal.ico -
}

restart_shell() {
    echo "Restarting shell..."
    $SHELL -l
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
