fpath=( $fpath $ZDOTDIR/autoloat/lib(N-/) )
autoload -Uz vital && vital set
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

vital unset

# Profiling configuration files of zsh
# if (which zprof > /dev/null) ;then
#   zprof > ~/.local/share/zsh/prof_result | less ~/.local/share/zsh/prof_result
# fi
