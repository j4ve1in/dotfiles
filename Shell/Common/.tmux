if which tmux >/dev/null 2>&1; then
    #if not inside a tmux session, and if no session is started, start a new session
    if [ -z "$TMUX" ];then
        tmux attach >/dev/null 2>&1 || tmux new-session >/dev/null 2>&1
    fi
fi
