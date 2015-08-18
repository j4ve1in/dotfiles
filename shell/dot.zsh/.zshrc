# Load
## Plugin
if [ -d ~/.zsh/bundle/antigen ]; then
  for file in ~/.zshrc.plugin.d/*.rc.zsh; do
    source ${file}
  done
fi

## ~/.zshrc.d/*.rc.zsh
for filepath in ~/.zshrc.d/*.rc.zsh; do
  source ${filepath}
done

## ~/.shrc.d/*.rc.sh
source ~/.shrc
