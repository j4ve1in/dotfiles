ADOTDIR=$HOME/.zsh/bundle
ANTIGEN_PLUGINS=(
  "zsh-users/zaw"
  "Tarrasch/zsh-bd"
  "zsh-users/zsh-syntax-highlighting"
)
ANTIGEN_FUNCTIONS=(
  "mollifier/cd-bookmark"
  "mollifier/cd-gitroot"
)

if [ ! -d ~/.zsh/bundle/repos ]; then
  source ~/.zsh/bundle/antigen/antigen.zsh
  # Plugin
  for plugin in ${ANTIGEN_PLUGINS[@]}; do
    { sleep 1; echo "Download $plugin"; antigen bundle $plugin; } | env LESS="-cE" less
  done

  # Function
  for function in ${ANTIGEN_FUNCTIONS[@]}; do
    { sleep 1; printf "Download $function"; antigen bundle $function; } | env LESS="-cE" less
  done

  # Others
  { sleep 1; printf "Download zsh-users/zsh-completions"; antigen bundle zsh-users/zsh-completions src; } | env LESS="-cE" less
else
  echo -e "\033[4;39mLoading Antigen\033[0;39m"
  source ~/.zsh/bundle/antigen/antigen.zsh
  # Plugin
  for plugin in ${ANTIGEN_PLUGINS[@]}; do
    printf " Loading $plugin..."
    antigen bundle $plugin
    echo -e "\033[1;36mdone\033[0;39m"
  done
  # Function
  for function in ${ANTIGEN_FUNCTIONS[@]}; do
    printf " Loading $function..."
    antigen bundle $function
    echo -e "\033[1;36mdone\033[0;39m"
  done
  # Others
  printf " Loading zsh-users/zsh-completions..."
  antigen bundle zsh-users/zsh-completions src
  echo -e "\033[1;36mdone\033[0;39m"
fi
antigen apply
echo
if which usleep >/dev/null 2>&1; then
  usleep 500000
fi
clear
