: "Load ~/.zsh/rc/*.zsh" && () {
  typeset file
  typeset -a ZRC
  # Plugin
  [ "$OSTYPE" != "msys" ] && ZRC=("plugins")
  # Others
  ZRC+=(
    'aliases'
    'base'
    'completion'
    'function'
    'prompt'
    'local'
  )
  for file in ${ZRC[@]}; do
    file=~/.zsh/rc/${file}.zsh
    [ -r "$file" ] && [ -f "$file" ] && . "$file"
  done
}

# Profiling configuration files of zsh
# if (which zprof > /dev/null) ;then
#   zprof > ~/.zsh/.zprof_result | less ~/.zsh/.zprof_result
# fi
