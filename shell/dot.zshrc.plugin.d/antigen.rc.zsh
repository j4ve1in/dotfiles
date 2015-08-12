ADOTDIR=$HOME/.zsh/bundle
ANTIGEN_PLUGINS=(
  "zsh-users/zaw"
  "Tarrasch/zsh-bd"
)
ANTIGEN_FUNCTIONS=(
  "mollifier/cd-bookmark"
  "mollifier/cd-gitroot"
)

echo -e "\033[4;39mLoading Antigen\033[0;39m"
source ~/.zsh/bundle/antigen/antigen.zsh

if [ -z "$(ls ~/.zsh/bundle/repos)" ]; then
  # Plugin
  for plugin in ${ANTIGEN_PLUGINS[@]}; do
    printf " Downloading $plugin..."
    { sleep 1; antigen bundle $plugin; } | env LESS="-cE" less
    echo -e "\033[1;36mdone\033[0;39m"
  done

  # Function
  for function in ${ANTIGEN_FUNCTIONS[@]}; do
    printf " Downloading $function..."
    { sleep 1; antigen bundle $function; } | env LESS="-cE" less
    echo -e "\033[1;36mdone\033[0;39m"
  done

  # Others
  printf " Downloading zsh-users/zsh-completions..."
  { sleep 1; antigen bundle zsh-users/zsh-completions src; } | env LESS="-cE" less
  echo -e "\033[1;36mdone\033[0;39m"
else
  # Plugin
  for plugin in ${ANTIGEN_PLUGINS[@]}; do
    printf " Downloading $plugin..."
    antigen bundle $plugin
    echo -e "\033[1;36mdone\033[0;39m"
  done
  # Function
  for function in ${ANTIGEN_FUNCTIONS[@]}; do
    printf " Downloading $function..."
    antigen bundle $function
    echo -e "\033[1;36mdone\033[0;39m"
  done
  # Others
  printf " Downloading zsh-users/zsh-completions..."
  antigen bundle zsh-users/zsh-completions src
  echo -e "\033[1;36mdone\033[0;39m"
fi
antigen apply
echo
sleep 1
clear
