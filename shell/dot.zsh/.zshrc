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
for file in ~/.zshrc.d/*.rc.zsh; do
  source ${file}
done

## alias
source ~/.shrc.d/aliases.rc.sh

## keychain
source ~/.shrc.d/keychain.autoload.rc.sh

## TMUX
if [ $OSTYPE != cygwin ]; then
  source ~/.shrc.d/tmux.autoload.rc.sh
fi
