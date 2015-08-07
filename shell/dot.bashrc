# Load
##  ~/.bashrc.d/*.rc.bash
for filepath in ~/.bashrc.d/*.rc.bash; do
  source ${filepath}
done

## ~/.shrc.d/*.rc.sh
source ~/.shrc
