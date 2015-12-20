# Load
##  ~/.bash/rc/*.bash
for filepath in ~/.bash/rc/*.bash; do
  source ${filepath}
done

## ~/.bash/rc/local.bash
BRCLOCAL=~/.bash/rc/local.bash
[ -r "$BRCLOCAL" ] && [ -f "$BRCLOCAL" ] && source "$BRCLOCAL"
unset -v BRCLOCAL

## ~/.shrc.d/*.sh
source ~/.shrc.d/base.sh
