function __fzf_change_directory
  fd --type directory | \
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
