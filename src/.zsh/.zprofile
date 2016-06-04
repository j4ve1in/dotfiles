[ -e '/etc/arch-release' ] && . ~/.zshenv
. ~/.sh/profile.sh
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
