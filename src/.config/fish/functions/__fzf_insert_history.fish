function __fzf_insert_history
  history merge
  history -z | \
    fzf \
      --read0 \
      --tiebreak=index \
      --bind=ctrl-r:toggle-sort \
      -q (commandline) | \
    tr -d '\n' | \
    read -lz cmd
  and commandline -- "$cmd"
  commandline -f repaint
end
