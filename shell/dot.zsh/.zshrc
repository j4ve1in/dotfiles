# Load
## Plugin
ANTIGENDIR=~/.zsh/bundle/antigen
ZRCPLUGIN=~/.zshrc.d/plugins.rc.zsh
[ "$OSTYPE" != "cygwin" ] && [ -d "$ANTIGENDIR" ] &&  source "$ZRCPLUGIN"
unset -v ANTIGENDIR ZRCPLUGIN

## ~/.zshrc.d/*.rc.zsh
ZRC=(
  "aliases"
  "base"
  "completion"
  "history"
  "prompt"
)
for file in ${ZRC[@]}; do
  file=~/.zshrc.d/${file}.rc.zsh
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done; unset -v ZRC file

## ~/.zshrc.d/local.rc.zsh
ZRCLOCAL=~/.zshrc.d/local.rc.zsh
[ -r "$ZRCLOCAL" ] && [ -f "$ZRCLOCAL" ] && source "$ZRCLOCAL"
unset -v ZRCLOCAL

## ~/.shrc.d/*.rc.sh
[ -r ~/.shrc ] && [ -f ~/.shrc ] && source ~/.shrc

# Profiling configuration files of zsh
# if (which zprof > /dev/null) ;then
#   zprof > ~/.zsh/.zprof_result | less ~/.zsh/.zprof_result
# fi
