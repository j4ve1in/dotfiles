ssh-add() {
  command ssh-add $@
  if [ $? != 0 ] && [ -z "$SSH_AUTH_SOCK" ] && [ -z "$SSH_AGENT_PID" ]; then
    printf "start ssh-aget (yes/no)? "
    read ANSWER

    case $ANSWER in
      "Y" | "y" | "Yes" | "yes" )
        echo Start ssh-agent
        eval `ssh-agent`
        ;;
      * )
        ;;
    esac
  fi
}

set-urxvt-font-size() {
  old_name=`grep -i '^\s*urxvt.font' ~/.Xdefaults | cut -d: -f2-`
  new_name=`echo "$old_name" | sed 's/:\(pixel\)\?size=[0-9]\+/'":\1size=$1/"`

  [ -n "$TMUX" ] && printf '\ePtmux;\e'
  printf '\e]50;%s\007' "$new_name"
  [ -n "$TMUX" ] && printf '\e\\'

  echo "Set font: $new_name"
}

mcd() {
  mkdir $1 && cd $1
}

fix_insecure_dir() {
  compaudit | xargs chmod g-w
}
