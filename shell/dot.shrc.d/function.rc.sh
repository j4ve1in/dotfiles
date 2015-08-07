ssh-add-key() {
  ARGS=$@
  if [ ! -z $ARGS ];then
    if [ -z "$SSH_AUTH_SOCK" ]; then
      echo Start ssh-agent
      eval `ssh-agent`
    elif [ -n "$SSH_AUTH_SOCK" ]; then
      echo "\`SSH_AUTH_SOCK\` is exist"
    fi
    command ssh-add $ARGS
  else
    echo "Argument isn't exist"
  fi
}
