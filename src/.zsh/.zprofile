fpath=( $fpath $ZDOTDIR/autoload/lib(N-/) )
autoload -Uz vital && vital set

is_arch || is_alpine && . ~/.zshenv

: "Display LastLogin and dotfiles status" && () {
  cprintf() { printf "\e[${2}m${1}\e[0;39;49m"; }
  # Display LastLogin
  if has lastlog; then
    local LASTLOG PORT DATE
    cprintf 'LastLogin: ' "1;38;05;75" # cyan
    LASTLOG=`last -R | sed -n 2p`
    set -- "${=LASTLOG}"
    PORT="$2" DATE="$3 $4 $5 $6"
    echo "$DATE on $PORT"
  fi
}

: "Launch tmux" && () {
  # if not inside a tmux session, and if no session is started,
  # start a new session
  if has tmux && [ -z "$TMUX" ]; then
    tmux attach -d >/dev/null 2>&1 || tmux
  fi
}

: "Compile configuration files of zsh" && () {
  typeset -a ZFILE
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
  local i N
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
}

vital unset
