ssh-add() {
  command ssh-add $@
  if [ $? != 0 ] && [ -z "$SSH_AUTH_SOCK" ] && [ -z "$SSH_AGENT_PID" ]; then
    printf "start ssh-aget (yes/no)? "
    read local ANSWER

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

mcd() { mkdir $1 && cd $1; }

function man {
  local p
  local m
  if [ "$PAGER" != "" ];then
    p="$PAGER"
  fi
  if [ "$MANPAGER" != "" ];then
    m="$MNNPAGER"
  fi
  unset PAGER
  unset MANPAGER
  val=$(command man $* 2>&1)
  ret=$?
  if [ $ret -eq 0 ];then
    echo "$val"|col -bx|vim -R -c 'set ft=man' -
  else
    echo "$val"
  fi
  if [ "$p" != "" ];then
    export PAGER="$p"
  fi
  if [ "$m" != "" ];then
    export MANPAGER="$m"
  fi
  return $ret
}
