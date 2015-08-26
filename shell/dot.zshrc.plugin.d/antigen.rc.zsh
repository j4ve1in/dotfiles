readonly ADOTDIR=$HOME/.zsh/bundle
ANTIGEN_PLUGINS=(
  "zsh-users/zaw"
  "Tarrasch/zsh-bd"
  "mollifier/cd-bookmark"
  "mollifier/cd-gitroot"
  "zsh-users/zsh-syntax-highlighting"
  "unixorn/autoupdate-antigen.zshplugin"
)

local BLUE="\x1b[34m"
local SKYBLUE="\033[1;38;05;75m"

download_plugin() {
  local plugin="$1"
  local location="$2"
  {
    sleep 1
    echo "Download $plugin"
    antigen bundle $plugin $location
  } | env LESS="-cE" less
}
cprintf() {
  local color="$1"
  local string="$2"
  local reset="\x1b[0m"
  printf "${color}${string}${reset}"
}

display_loading_plugin() {
  local plugin="$1"
  local numer="$2"
  local denom="$3"
  cprintf $SKYBLUE "Loading plugin: "
  cprintf $BLUE "("
  printf "%d/%d" $numer $denom
  cprintf $BLUE ") "
  printf "\r\c"
}

if [ ! -d ~/.zsh/bundle/repos ]; then
  source ~/.zsh/bundle/antigen/antigen.zsh
  # Plugin
  for plugin in ${ANTIGEN_PLUGINS[@]}; do
    download_plugin $plugin
  done

  # Others
  download_plugin zsh-users/zsh-completions src
else
  i=0
  N=$((${#ANTIGEN_PLUGINS[@]}+2))
  display_loading_plugin Antigen $((i+1)) N
  if which usleep >/dev/null 2>&1; then
    usleep 100000
  fi
  source ~/.zsh/bundle/antigen/antigen.zsh && ((i=i+1))
  # Plugin
  for plugin in ${ANTIGEN_PLUGINS[@]}; do
    display_loading_plugin $plugin $((i+1)) N
    if which usleep >/dev/null 2>&1; then
      usleep 100000
    fi
    antigen bundle $plugin && ((i=i+1))
  done
  # Others
  display_loading_plugin zsh-users/zsh-completions $((i+1)) N
  antigen bundle zsh-users/zsh-completions src && ((i=i+1))
  if [ "$((i-1))" = "$N" ]; then
    echo -e "\nError"
  fi
fi
echo

antigen apply
