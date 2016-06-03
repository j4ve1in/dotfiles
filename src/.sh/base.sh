has() { type $1 >/dev/null 2>&1; }

[ `uname` != Darwin ] && eval `dircolors -b ~/.dir_colors`

stty stop undef

# Launch tmux
# if not inside a tmux session, and if no session is started,
# start a new session
if has tmux && [ -z "$TMUX" ]; then
  tmux attach -d >/dev/null 2>&1 || tmux
fi
