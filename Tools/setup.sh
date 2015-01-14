#!/bin/bash
menu() {
PS3="> "
ans1="Update"
ans2="Backup"
ans3="Deploy"
ans4="Reinstall"
ans5="Uninstall"
ans6="Exit"

echo "Menu"
#echo "実行したい処理を数字で指定してください"
select ANS in "$ans1" "$ans2" "$ans3" "$ans4" "$ans5" "$ans6"; do
   case $REPLY in
        1)
            bash ~/.dotfiles/Tools/update.sh
            break
            ;;
        2)
            bash ~/.dotfiles/Tools/backup.sh
            break
            ;;
        3)
            bash ~/.dotfiles/Tools/deploy.sh
            break
            ;;
        4)
            bash ~/.dotfiles/Tools/reinstall.sh
            break
            ;;
        5)
            bash ~/.dotfiles/Tools/uninstall.sh
            break
            ;;
        6)
            echo -e "exit\n"
            exit 0
            ;;
        *)
            echo -e "\e[1;31mError\e[m\n"
            #echo "範囲内の数字を入力してください"
            menu
            ;;
    esac
done
}

menu
