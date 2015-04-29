# Load
## Plugin
for file in ~/.zshrc.plugin.d/*.rc.zsh; do
  source ${file}
done

## Function
for file in ~/.zshrc.function.d/*.rc.zsh; do
  source ${file}
done

## ~/.zshrc.d/*.rc.zsh
for file in ~/.zshrc.d/*.rc.zsh; do
  source ${file}
done

## alias
source ~/.shrc.d/aliases.rc.sh

## keychain
source ~/.shrc.d/keychain.autoload.rc.sh

## TMUX
source ~/.shrc.d/tmux.autoload.rc.sh
