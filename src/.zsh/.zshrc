# Load
## ~/.zsh/rc/*.zsh
### Plugin
[ "$OSTYPE" != "cygwin" ] && ZRC=("plugins")
### Others
ZRC+=(
  'aliases'
  'base'
  'completion'
  'history'
  'prompt'
  'local'
)
for file in ${ZRC[@]}; do
  file=~/.zsh/rc/${file}.zsh
  [ -r "$file" ] && [ -f "$file" ] && . "$file"
done; unset -v ZRC file

## ~/.sh/rc/*.sh
INIT_SH=~/.sh/rc/init.sh
[ -r $INIT_SH ] && [ -f $INIT_SH ] && . $INIT_SH

# Profiling configuration files of zsh
# if (which zprof > /dev/null) ;then
#   zprof > ~/.zsh/.zprof_result | less ~/.zsh/.zprof_result
# fi
