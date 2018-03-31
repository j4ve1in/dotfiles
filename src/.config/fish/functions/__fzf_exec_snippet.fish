function __fzf_exec_snippet
  pet search --query (commandline) | \
    read -l cmd

  if not test -z "$cmd"
    commandline -- "$cmd"
    commandline -f repaint
    commandline -f execute
  else
    commandline -f repaint
  end
end
