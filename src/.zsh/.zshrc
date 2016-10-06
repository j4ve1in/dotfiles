. $ZDOTDIR/autoload/init.zsh ${(%):-%N}

: "Load ~/.zsh/rc/*.zsh" && () {
  typeset file
  typeset -a ZRC
  ZRC=(
    'plugins'
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
#   zprof > ~/.local/share/zsh/prof_result | less ~/.local/share/zsh/prof_result
# fi
