# Load
## Plugin
if [ "$OSTYPE" != "cygwin" ]; then
  if [ -d ~/.zsh/bundle/antigen ]; then
    source ~/.zshrc.d/plugins.rc.zsh
  fi
fi

## ~/.zshrc.d/*.rc.zsh
ZFILE=(
  "aliases.rc.zsh"
  "base.rc.zsh"
  "completion.rc.zsh"
  "history.rc.zsh"
  "prompt.rc.zsh"
)
for file in ${ZFILE[@]}; do
  source ~/.zshrc.d/$file
done

## ~/.shrc.d/*.rc.sh
source ~/.shrc

# Profiling configuration files of zsh
# if (which zprof > /dev/null) ;then
#   zprof > ~/.zsh/.zprof_result | less ~/.zsh/.zprof_result
# fi
