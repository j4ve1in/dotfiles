# Load
## ~/.zsh/rc/*.zsh
### Plugin
[ "$OSTYPE" != "msys" ] && ZRC=("plugins")
### Others
ZRC+=(
  'aliases'
  'base'
  'completion'
  'function'
  'history'
  'prompt'
  'local'
)
for file in ${ZRC[@]}; do
  file=~/.zsh/rc/${file}.zsh
  [ -r "$file" ] && [ -f "$file" ] && . "$file"
done; unset -v ZRC file

# Profiling configuration files of zsh
# if (which zprof > /dev/null) ;then
#   zprof > ~/.zsh/.zprof_result | less ~/.zsh/.zprof_result
# fi
