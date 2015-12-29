ssh-add() {
  if [ -n "$1" ]; then
    if [ "$1" = "-p" ] || [ "$1" = "--lpass" ]; then
      ssh-add-with-lpass $2
    elif ! command ssh-add $@; then
      echo "  -p hostname Use lpass.\n"
      if [ -z "$SSH_AUTH_SOCK" ] && [ -z "$SSH_AGENT_PID" ]; then
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
    fi
  fi
}

ssh-add-with-lpass() {
  main() {
    if type ssh-add expect >/dev/null 2>&1; then
      if [ -n "$1" ]; then
        REMOTE_HOST=$1
      else
        echo "missing argument"
        echo "usage: ssh-add -p [remote_hostname]\n"
        return 1
      fi

      if type lpass >/dev/null 2>&1; then
        if [ -e ~/.lpass/username ]; then
          identity-add
        else
          echo "Error: You need to login lastpass."
          printf "  Username: "
          read LASTPASS_USERNAME
          printf "  "
          if ! lpass login $LASTPASS_USERNAME; then
            return 1
          fi
          identity-add
        fi
      else
        echo "Error: You need to install \`lpass\`."
        return 1
      fi
    else
      if ! type ssh-add expect >/dev/null 2>&1; then
        echo "Error: You need to install \`ssh-add\` and \`expect\`."
      elif type ssh-add >/dev/null 2>&1; then
        echo "Error: You need to install \`ssh-add\`."
      elif type expect >/dev/null 2>&1; then
        echo "Error: You need to install \`expect\`."
      fi
    fi
  }

  identity-add() {
    PASSPHRASE=$(lpass show --field=Passphrase ${REMOTE_HOST}\(${USER}@$(hostname -s)\))
    SSH_KEY_PATH=${HOME}/.ssh/key/${REMOTE_HOST}
    expect -c "
    spawn ssh-add $SSH_KEY_PATH
    expect \"Enter passphrase for ${SSH_KEY_PATH}:\"
    send -- \"${PASSPHRASE}\n\"
    expect \"$\"
    exit 0
    " >/dev/null 2>&1
    echo "Identity added: $SSH_KEY_PATH"
  }
  main $@
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

man() {
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
