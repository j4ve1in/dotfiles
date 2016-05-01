[ -e '/etc/arch-release' ] && . ~/.zshenv
. ~/.sh/profile.sh
# Compile
ZFILE=(
  ~/.zshenv
  ~/.zsh/.zprofile
  ~/.zsh/.zshrc
  ~/.zsh/rc/*.zsh
)
local BLUE="\x1b[1;34m"
local SKYBLUE="\x1b[1;38;05;75m"
cprintf() {
  local color="$1"
  local string="$2"
  local reset="\x1b[0m"
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
  cprintf $SKYBLUE "Compile zsh's configuration files\n"
  for file in ${ZFILE[@]}; do
    if [ ! -f ${file}.zwc ] || [ ${file} -nt ${file}.zwc ]; then
      cprintf $BLUE " ["
      printf "%2d/%2d" $i $N
      cprintf $BLUE "] "
      printf "Compile ${file}..."
      if zcompile ${file}; then
        cprintf $BLUE "done\n"
      else
        echo -e "\033[1;31merror\033[m"
      fi
      ((i=i+1))
    fi
  done
fi
unset ZFILE
