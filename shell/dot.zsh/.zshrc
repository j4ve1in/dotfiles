# Load
if [ -d ~/.zsh/bundle/antigen ]; then
  ## Plugin
  for file in ~/.zshrc.plugin.d/*.rc.zsh; do
    source ${file}
  done

  ## Function
  for file in ~/.zshrc.function.d/*.rc.zsh; do
    source ${file}
  done
fi

## ~/.zshrc.d/*.rc.zsh
for filepath in ~/.zshrc.d/*.rc.zsh; do
  source ${filepath}
done

## ~/.shrc.d/*.rc.sh
source ~/.shrc
