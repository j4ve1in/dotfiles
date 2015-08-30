# Antigen
readonly ADOTDIR=$HOME/.zsh/bundle
ANTIGEN_PLUGINS=(
  "zsh-users/zaw"
  "Tarrasch/zsh-bd"
  "mollifier/cd-gitroot"
  "zsh-users/zsh-syntax-highlighting"
  "unixorn/autoupdate-antigen.zshplugin"
)

local BLUE="\x1b[34m"
local SKYBLUE="\033[1;38;05;75m"

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
echo

antigen apply

# cd-gitroot
alias cdu='cd-gitroot'

# Syntax-highlighting
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=blue
ZSH_HIGHLIGHT_STYLES[alias]=fg=129,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=111,bold
ZSH_HIGHLIGHT_STYLES[function]=fg=87,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=27
ZSH_HIGHLIGHT_STYLES[precommand]=fg=cyan,underline
ZSH_HIGHLIGHT_STYLES[commandseparator]=none
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=cyan
ZSH_HIGHLIGHT_STYLES[path]=fg=75,bold
ZSH_HIGHLIGHT_STYLES[path_prefix]=none
ZSH_HIGHLIGHT_STYLES[path_approx]=none
ZSH_HIGHLIGHT_STYLES[globbing]=fg=51
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=250
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=245
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=cyan
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=cyan
ZSH_HIGHLIGHT_STYLES[assign]=none

# Zaw
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 500
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':chpwd:*' recent-dirs-pushd true
zstyle ':completion:*' recent-dirs-insert both
zstyle ':completion:*:*:cdr:*:*' menu selection

# Reload zaw.zsh for loading zaw-cdr(bug of Antigen or zaw?)
source ~/.zsh/bundle/repos/*/zaw.zsh

bindkey '^X^A' zaw-applications
bindkey '^X^B' zaw-bookmark
bindkey '^@' zaw-cdr
bindkey '^R' zaw-history
bindkey '^X^F' zaw-git-files
bindkey '^X^C' zaw-git-branches
bindkey '^X^P' zaw-process
bindkey '^S' zaw-ssh-hosts
bindkey '^T' zaw-tmux

zstyle ':filter-select:highlight' selected bg=blue
zstyle ':filter-select:highlight' matched fg=cyan
zstyle ':filter-select' max-lines -10
zstyle ':filter-select' rotate-list yes
zstyle ':filter-select' case-insensitive yes
zstyle ':filter-select' extended-search yes
