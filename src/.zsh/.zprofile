[ -e '/etc/arch-release' ] && . ~/.zshenv

has() { type $1 >/dev/null 2>&1; }

if [ "$OSTYPE" != "msys" ]; then
  cprintf() { printf "\e[${2}m${1}\e[0;39;49m"; }
  # Display LastLogin
  if has lastlog; then
    cprintf 'LastLogin: ' "1;38;05;75" # cyan
    LASTLOG=`last -R | sed -n 2p`
    set -- "${=LASTLOG}"
    PORT="$2" DATE="$3 $4 $5 $6"
    echo "$DATE on $PORT"
  fi

  # Check for updates
  git -C ~/.dotfiles fetch >/dev/null 2>&1
  LOCAL=`git -C ~/.dotfiles log HEAD`
  REMOTE=`git -C ~/.dotfiles log origin/HEAD`
  cprintf 'Dotfiles version: ' "1;38;05;75" # cyan
  if [ "$LOCAL" = "$REMOTE" ]; then
    echo 'up to date'
  else
    echo 'local out of date'
    printf ' Would you like to update (yes/no)? '
    read -q ANSWER
    echo
    [[ "$ANSWER" =~ Y\|y ]] && echo && dotsetup -u
  fi
fi

# Load keychain
if has keychain; then
  keychain --nogui --quiet
  [ -f ~/.keychain/$HOST-sh ] && source ~/.keychain/$HOST-sh
fi

# Compile
ZFILE=(
  ~/.zshenv
  ~/.zsh/.zprofile
  ~/.zsh/.zshrc
  ~/.zsh/rc/*.zsh
)
local BLUE="\e[1;34m"
local SKYBLUE="\e[1;38;05;75m"
cprintf() {
  local color="$1"
  local string="$2"
  local reset="\e[0m"
  printf "${color}${string}${reset}"
}
## Check
i=0
for file in ${ZFILE[@]}; do
  if [ ! -f ${file}.zwc ] || [ ${file} -nt ${file}.zwc ]; then
    ((i=i+1))
  fi
done
N=$i

## Start
if [ "$N" != "0" ]; then
  i=1
  cprintf $SKYBLUE "Compile configuration files of zsh\n"
  for file in ${ZFILE[@]}; do
    if [ ! -f ${file}.zwc ] || [ ${file} -nt ${file}.zwc ]; then
      cprintf $BLUE " ["
      printf "%2d/%2d" $i $N
      cprintf $BLUE "] "
      printf "Compile ${file}..."
      if zcompile ${file}; then
        cprintf $BLUE "done\n"
      else
        echo -e "\e[1;31merror\e[m"
      fi
      ((i=i+1))
    fi
  done
fi
unset ZFILE
