ZPLUG_HOME="$HOME/.zsh/bundle"
ZPLUG_PLUGINS=(
  'b4b4r07/zplug'
  'zsh-users/zaw'
  'Tarrasch/zsh-bd'
  'mollifier/cd-gitroot'
  'zsh-users/zsh-completions'
  'zsh-users/zsh-syntax-highlighting'
)

load_plugin() {
  local plugin="$1"
  zplug $plugin
}

if [ ! -d ~/.zsh/bundle/repos ]; then
  source ~/.zsh/bundle/zplug/zplug
  zplug update --self
  # Plugin
  for plugin in ${ZPLUG_PLUGINS[@]}; do
    load_plugin $plugin
  done
  {
    sleep 1
    zplug install
  } | env LESS="-cE" less
fi
echo

zplug load --verbose >/dev/null 2>&1
