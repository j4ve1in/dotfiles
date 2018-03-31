function __fzf_git_change_repository
  ghq list -p | \
    sort | \
    sed "s|$HOME|~|g" | \
    fzf +m | \
    read -l dir

  if not test -z "$dir"
    commandline "cd $dir"
    commandline -f repaint
    commandline -f execute
  else
    commandline -f repaint
  end
end
