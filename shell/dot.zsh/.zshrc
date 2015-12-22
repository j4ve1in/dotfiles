# Load
## Plugin
ANTIGENDIR=~/.zsh/bundle/antigen
ZRCPLUGIN=~/.zsh/rc/plugins.zsh
[ "$OSTYPE" != "cygwin" ] && [ -d "$ANTIGENDIR" ] &&  source "$ZRCPLUGIN"
unset -v ANTIGENDIR ZRCPLUGIN

## ~/.zsh/rc/*.zsh
ZRC=(
  "aliases"
  "base"
  "completion"
  "history"
  "prompt"
)
for file in ${ZRC[@]}; do
  file=~/.zsh/rc/${file}.zsh
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done; unset -v ZRC file

## ~/.zsh/rc/local.zsh
ZRCLOCAL=~/.zsh/rc/local.zsh
[ -r "$ZRCLOCAL" ] && [ -f "$ZRCLOCAL" ] && source "$ZRCLOCAL"
unset -v ZRCLOCAL

## ~/.shrc.d/*.sh
[ -r ~/.shrc.d/init.sh ] && [ -f ~/.shrc.d/init.sh ] && source ~/.shrc.d/init.sh

# Profiling configuration files of zsh
# if (which zprof > /dev/null) ;then
#   zprof > ~/.zsh/.zprof_result | less ~/.zsh/.zprof_result
# fi
