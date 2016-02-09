ZPLUG_HOME="$HOME/.zsh/bundle"
ZPLUG_PLUGINS=(
  'b4b4r07/zplug'
  'zsh-users/zaw'
  'Tarrasch/zsh-bd'
  'mollifier/cd-gitroot'
  'zsh-users/zsh-completions'
  'zsh-users/zsh-syntax-highlighting'
  'mollifier/anyframe'
  'junegunn/fzf-bin, as:command, from:gh-r, file:fzf'
  'junegunn/fzf, as:command, of:bin/fzf-tmux'
)

if [ ! -d ~/.zsh/bundle/repos ]; then
  source ~/.zsh/bundle/zplug/zplug
  zplug update --self
  # Plugin
  for plugin in ${ZPLUG_PLUGINS[@]}; do
    zplug "$plugin"
  done
  zplug install
fi
echo

zplug load --verbose >/dev/null 2>&1
