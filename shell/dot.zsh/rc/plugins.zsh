# Zplug
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
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

local BLUE="\x1b[34m"
local RED="\x1b[1;31;49m"
local SKYBLUE="\033[1;38;05;75m"

cprintf() {
  local color="$1"
  local string="$2"
  local args="$3"
  local reset="\x1b[0m"
  printf "${color}${string}${reset}" $args
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
N=$((${#ZPLUG_PLUGINS[@]}+1))
display_loading_plugin Zplug $((i+1)) N
source ~/.zsh/bundle/zplug/zplug && ((i=i+1))
if which usleep >/dev/null 2>&1; then
  usleep 100000
fi
for plugin in ${ZPLUG_PLUGINS[@]}; do
  #set -- ${=plugin}
  #plugin="$1"
  # dir=$2
  display_loading_plugin $plugin $((i+1)) N
  zplug "$plugin" >/dev/null 2>&1 && ((i=i+1))
  if which usleep >/dev/null 2>&1; then
    usleep 100000
  fi
done
if [ "$i" = "$N" ]; then
  echo
else
  cprintf $SKYBLUE "Loading plugin: "
  cprintf $BLUE "("
  cprintf $RED "%d" $i
  printf "/%d" $N
  cprintf $BLUE ") "
  printf "\r\c"
  cprintf $RED "\n Error:"
  printf " loading failed\n"
fi

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# zplug apply
zplug load --verbose >/dev/null 2>&1

# cd-gitroot
if zplug check 'mollifier/cd-gitroot'; then
  fpath=(${HOME}/.zsh/bundle/repos/mollifier/cd-gitroot(N-/) $fpath)
  alias cdu='cd-gitroot'
fi

# Syntax-highlighting
if zplug check 'zsh-users/zsh-syntax-highlighting'; then
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
fi

# Zaw
if zplug check 'zsh-users/zaw'; then
  zstyle ':chpwd:*' recent-dirs-max 500
  zstyle ':chpwd:*' recent-dirs-default true
  zstyle ':chpwd:*' recent-dirs-pushd true
  zstyle ':completion:*' recent-dirs-insert both
  zstyle ':completion:*:*:cdr:*:*' menu selection

  bindkey '^Y' zaw-applications
  bindkey '^^' zaw-bookmark
  bindkey '^O' zaw-open-file
  bindkey '^@' zaw-cdr
  bindkey '^R' zaw-history
  bindkey '^]' zaw-git-files
  bindkey '^\' zaw-git-branches
  bindkey '^Q' zaw-process
  bindkey '^S' zaw-ssh-hosts
  bindkey '^T' zaw-tmux

  zstyle ':filter-select:highlight' selected bg=blue
  zstyle ':filter-select:highlight' matched fg=cyan
  zstyle ':filter-select' max-lines -10
  zstyle ':filter-select' rotate-list yes
  zstyle ':filter-select' case-insensitive yes
  zstyle ':filter-select' extended-search yes
fi

if zplug check 'mollifier/anyframe'; then
  if type tmux >/dev/null 2>&1; then
    zstyle ":anyframe:selector:fzf:" command 'fzf-tmux'
  fi
  bindkey '^@' anyframe-widget-cdr
  bindkey '^x^b' anyframe-widget-checkout-git-branch

  bindkey '^r' anyframe-widget-execute-history

  bindkey '^xp' anyframe-widget-put-history
  bindkey '^x^p' anyframe-widget-put-history

  bindkey '^xg' anyframe-widget-cd-ghq-repository
  bindkey '^x^g' anyframe-widget-cd-ghq-repository

  bindkey '^xk' anyframe-widget-kill
  bindkey '^x^k' anyframe-widget-kill

  bindkey '^xi' anyframe-widget-insert-git-branch
  bindkey '^x^i' anyframe-widget-insert-git-branch

  bindkey '^xf' anyframe-widget-insert-filename
  bindkey '^x^f' anyframe-widget-insert-filename

  bindkey '^x;' anyframe-widget-select-widget
fi

if zplug check 'junegunn/fzf-bin'; then
  export FZF_DEFAULT_OPTS='
    --color fg:15,bg:16,hl:27,fg+:15,bg+:21,hl+:75
    --color info:69,prompt:75,spinner:69,pointer:69,marker:69
  '
fi

# ghq
fpath=($fpath ${GOPATH}/src/*/*/ghq/zsh(N-/))
