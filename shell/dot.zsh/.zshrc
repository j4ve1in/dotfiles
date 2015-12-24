# Load
## ~/.zsh/rc/*.zsh
### Plugin
ANTIGENDIR=~/.zsh/bundle/antigen
ZRCPLUGIN=~/.zsh/rc/plugins.zsh
[ "$OSTYPE" != "cygwin" ] && [ -d "$ANTIGENDIR" ] && ZRC=("plugins")
### Others
ZRC+=(
  "aliases"
  "base"
  "completion"
  "history"
  "prompt"
  "local"
)
for file in ${ZRC[@]}; do
  file=~/.zsh/rc/${file}.zsh
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done; unset -v ANTIGENDIR ZRCPLUGIN ZRC file

## ~/.shrc.d/*.sh
[ -r ~/.shrc.d/init.sh ] && [ -f ~/.shrc.d/init.sh ] && source ~/.shrc.d/init.sh

# Profiling configuration files of zsh
# if (which zprof > /dev/null) ;then
#   zprof > ~/.zsh/.zprof_result | less ~/.zsh/.zprof_result
# fi
