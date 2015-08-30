readonly ADOTDIR=$HOME/.zsh/bundle
ANTIGEN_PLUGINS=(
  "zsh-users/zaw"
  "Tarrasch/zsh-bd"
  "mollifier/cd-gitroot"
  "zsh-users/zsh-syntax-highlighting"
  "unixorn/autoupdate-antigen.zshplugin"
)

download_plugin() {
  local plugin="$1"
  local location="$2"
  {
    sleep 1
    echo "Download $plugin"
    antigen bundle $plugin $location
  } | env LESS="-cE" less
}

if [ ! -d ~/.zsh/bundle/repos ]; then
  source ~/.zsh/bundle/antigen/antigen.zsh
  # Plugin
  for plugin in ${ANTIGEN_PLUGINS[@]}; do
    download_plugin $plugin
  done

  # Others
  download_plugin zsh-users/zsh-completions src
fi
ech

antigen apply
