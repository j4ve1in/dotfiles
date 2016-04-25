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

mcd() { mkdir $1 && cd $1; }

xlb() { xbacklight -set ${1}0;}

trash() {
  TRASH_DIR="${HOME}/.local/share/Trash/files"
  [ -e "$TRASH_DIR" ] || mkdir -p "$TRASH_DIR"
  case "$1" in
    '-a' )
      if [ -n "`ls -A $TRASH_DIR`" ]; then
        printf "trash: remove trash? "; read ANSWER
        case $ANSWER in
          "Y" | "y" | "Yes" | "yes" )
            /bin/rm -rf ${TRASH_DIR}/*
            echo 'removed trash'
            ;;
          * )
            ;;
        esac
      else
        echo "trash: $TRASH_DIR is empty"
      fi
      return 0
      ;;
    '-s' )
      if [ -n "`ls -A $TRASH_DIR`" ]; then
        ls -Ahl --time-style=long-iso $TRASH_DIR
      else
        echo 'trash: $TRASH_DIR is empty'
      fi
      return 0
      ;;
    '-h' )
      echo "usage: trash [OPTION] [FILE]"
      echo "  -s show status"
      echo "  -a remove trash"
      echo
      return 0
      ;;
    -* )
      echo "trash: illegal option -- '$(echo $1 | sed 's/^-*//')'"
      echo -e "Try 'trash -h' for more information.\n"
      return 0
      ;;
    '' )
      echo -e "Try 'trash -h' for more information.\n"
      return 0
      ;;
  esac

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

search() { find . -type f -print | xargs grep $1; }
