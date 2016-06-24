# Load
##  ~/.bash/rc/*.bash
BRC=(
  'base'
  'history'
  'prompt'
  'local'
)
for file in ${BRC[@]}; do
  file=~/.bash/rc/${file}.bash
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done; unset -v BRC file

## ~/.sh/*.sh
INIT_SH=~/.sh/rc/init.sh
[ -r $INIT_SH ] && [ -f $INIT_SH ] && source $INIT_SH
