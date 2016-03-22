[ -d "${HOME}/.local/bin" ] && PATH+=":${HOME}/.local/bin"
[ -d "${HOME}/.tmux/bin" ] && PATH+=":${HOME}/.tmux/bin"
urxvtc -e bash -c 'tmux -q has-session >/dev/null 2>&1 && exec tmux attach -d >/dev/null 2>&1 || exec tmux'
