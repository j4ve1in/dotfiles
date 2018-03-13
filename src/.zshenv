# XDG
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share
[[ ! -d $XDG_CACHE_HOME ]] && mkdir -p $XDG_CACHE_HOME
[[ ! -d $XDG_DATA_HOME ]] && mkdir -p $XDG_DATA_HOME

# base
export PAGER='less'
export EDITOR='nvim -p'
export DIFFPROG='nvim -d'
export TERMINAL='termite'
eval `dircolors -b $XDG_CONFIG_HOME/dircolors`
export GPG_TTY=`tty`
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export GTK_IM_MODULE=fcitx QT_IM_MODULE=fcitx XMODIFIERS='@im=fcitx'

## zsh
export ZDOTDIR=~/.zsh
export ZSH_CACHE_HOME=$XDG_CACHE_HOME/zsh
[[ ! -d $ZSH_CACHE_HOME ]] && mkdir $ZSH_CACHE_HOME
export ZSH_DATA_HOME=$XDG_DATA_HOME/zsh
[[ ! -d $ZSH_DATA_HOME ]] && mkdir $ZSH_DATA_HOME
export {HISTSIZE,SAVEHIST}="100"
export HISTFILE="$ZSH_CACHE_HOME/history"
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export ZPLUG_HOME=$ZSH_DATA_HOME/plugins
export ZPLUG_CACHE_DIR=$ZSH_CACHE_HOME/plugins/zplug/cache
[[ ! -d $ZPLUG_CACHE_DIR ]] && mkdir -p $ZPLUG_CACHE_DIR

# path
path=($path $HOME/.local/bin(N-/))
path=($path `ruby -rubygems -e 'puts Gem.user_dir'`/bin(N-/))
path=($path `yarn global bin`(N-/))

if [[ -d $XDG_DATA_HOME/anyenv ]] ; then
  export ANYENV_ROOT="$XDG_DATA_HOME/anyenv"
  path=($ANYENV_ROOT/bin(N-/) $path)
  eval "`anyenv init - --no-rehash`"
  for D in `ls $ANYENV_ROOT/envs`; do
    path=($ANYENV_ROOT/envs/$D/shims(N-/) $path)
  done
fi

fpath=(
  $fpath
  $ZDOTDIR/autoload/**/*(N-/)
)

# Programming
export GOPATH="$HOME/.local"
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

# urxvt
if [[ $DISPLAY ]]; then
  export URXVT_RUNTIME_DIR=$XDG_RUNTIME_DIR/urxvt
  [[ ! -d $URXVT_RUNTIME_DIR ]] && mkdir $URXVT_RUNTIME_DIR
  export RXVT_SOCKET="$URXVT_RUNTIME_DIR/urxvt-`hostname`"
fi

# Less
export LESS='-ciMR' LESS_TERMCAP_{mb,md,me,se,so,ue,us}
LESS_TERMCAP_mb=$'\e[1;31m'
LESS_TERMCAP_md=$'\e[1;38;05;75m'
LESS_TERMCAP_me=$'\e[0m'
LESS_TERMCAP_se=$'\e[0m'
LESS_TERMCAP_so=$'\e[1;44m'
LESS_TERMCAP_ue=$'\e[0m'
LESS_TERMCAP_us=$'\e[1;36m'
export LESS_CACHE_HOME=$XDG_CACHE_HOME/less
[[ ! -d $LESS_CACHE_HOME ]] && mkdir $LESS_CACHE_HOME
export LESSHISTFILE="$LESS_CACHE_HOME/history"

# fzf-widgets
export DOT_HOME=~/.local/src/github.com/ytet5uy4/dotfiles
export DOT_BASE_DIR=$DOT_HOME/src

# fzf
[[ $DISPLAY ]] && fzf_prompt="`echo '\u25b6'`" || fzf_prompt='>'
export FZF_DEFAULT_OPTS="
  --ansi
  --exit-0
  --extended
  --cycle
  --multi
  --height 40%
  --reverse
  --prompt=\"$fzf_prompt \"
  --color hl:27,bg+:21,hl+:75
  --color info:69,prompt:75,spinner:69,pointer:69,marker:69
  --bind ctrl-j:jump-accept
"
unset fzf_prompt

# AWS
export AWS_SDK_LOAD_CONFIG=1
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"

# local
[[ -f ~/.zshenv.local ]] && . ~/.zshenv.local
