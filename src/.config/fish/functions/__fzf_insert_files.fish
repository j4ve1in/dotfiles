function __fzf_insert_files
  fzf -m | \
    while read -l file
      set files $files $file
    end

  if test -z "$files"
    commandline -f repaint
    return
  end

  commandline -t ""
  for file in $files
    commandline -it -- (string escape $file)
    commandline -it -- " "
  end
  commandline -f repaint
end
