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
  [ "$PAGER" != "" ] && local p="$PAGER" && unset PAGER
  [ "$MANPAGER" != "" ] && local m="$MNNPAGER" && unset MANPAGER
  if command man $* >/dev/null 2>&1;then
    vim +"r !command man $* 2>&1 | col -bx" +"normal ggdd" +'set ft=man'
    return 0
  else
    echo "$(command man $* 2>&1)"; return 1
  fi
  [ "$p" != "" ] && export PAGER="$p"
  [ "$m" != "" ] && export MANPAGER="$m"
}

xlb() { xbacklight -set ${1}0;}

gyazo_markdown() {
  local URL="`command gyazo | head -n 1`"
  local IMAGE_URL="`echo ${URL}.png | sed 's/gyazo.com/i.gyazo.com/'`"
  echo "[![alt属性](${IMAGE_URL})](${URL})" | xsel -bi
}

trash() {
  TRASH_DIR="${HOME}/.local/share/Trash/files"
  [ -e "$TRASH_DIR" ] || mkdir -p "$TRASH_DIR"
  if [ "$1" = "-a" ]; then
    if [ -n "`ls -A $TRASH_DIR`" ]; then
      printf "trash: remove trash? "; read ANSWER
      echo
      case $ANSWER in
        "Y" | "y" | "Yes" | "yes" )
          /bin/rm -rf ${TRASH_DIR}/*
          echo 'removed trash'
          ;;
        * )
          ;;
      esac
    else
      echo 'trash: $TRASH_DIR is empty'
    fi
    return 0
  elif [ "$1" = "-s" ]; then
    if [ -n "`ls -A $TRASH_DIR`" ]; then
      ls -Ahl --time-style=long-iso $TRASH_DIR
    else
      echo 'trash: $TRASH_DIR is empty'
    fi
    return 0
  fi

  for file in $@; do
    if [ ! -e "$file" ]; then
      echo "trash: cannot stat \`${file}\`: No such file or directory"
      NO_SUCH_FILE=1
    fi
  done
  [ "$NO_SUCH_FILE" = "1" ] && return 1
  mv -f --backup='numbered' --target-directory="$TRASH_DIR" "$@" >/dev/null 2>&1
  echo "trash: removed ${@}"
  return 0
}
