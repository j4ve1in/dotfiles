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
