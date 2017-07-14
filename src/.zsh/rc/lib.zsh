zmodload zsh/terminfo
autoload -Uz add-zsh-hook

typeset -gA fg=(
  default ''
  main    '75'
  sub     '240'
  accent  '27'
  success '33'
  error   '196'
)

typeset -gA text=(
  fg '38'
  bg '48'
)

typeset -gA attr=(
  default   '0'
  bold      '1'
  underline '4'
)

__lib::print-space() { [[ $1 ]] && printf "%$1s" ' '; }

__lib::print-color() {
  private string="$1" reset="\e[$attr[default]m"

  private color
  if [[ -n $3 ]]; then
    color="\e[${3};$text[fg];5;${2}m"
  else
    color="\e[$attr[default];$text[fg];5;${2}m"
  fi

  printf "%b%b%b" "$color" "$string" "$reset"
}

__lib::print-color-bold() { __lib::print-color "$1" "$2" "$attr[bold]"; }

__lib::print-mark() {
  if [[ $1 = success ]]; then
    __lib::print-color-bold '\u2713' "$fg[success]"
  elif [[ $1 = error ]]; then
    __lib::print-color-bold '\u2715' "$fg[error]"
  fi
}

print-brackets() {
  if [[ $1 = Y/n ]]; then
    __lib::print-color-bold '[' "$fg[sub]"
    __lib::print-color 'Y' "$fg[main]" "$attr[underline]"
    __lib::print-color '/' "$fg[main]"
    __lib::print-color 'n' "$fg[main]" "$attr[underline]"
    __lib::print-color-bold ']' "$fg[sub]"
  else
    __lib::print-color-bold '[' "$fg[accent]"
    printf "$1"
    __lib::print-color-bold ']' "$fg[accent]"
  fi
}

__lib::prompt() {
  __lib::print-color-bold "$3? " "$fg[main]"
  [[ $2 ]] && printf "$2\n$3  "
  printf "$1? %s " "`print-brackets Y/n`"
  echoti cnorm
  read -q input
  echoti civis
  [[ $2 ]] && printf "\r$3  " || __lib::print-color-bold "\r$3? " "$fg[main]"
  printf "$1? %s " "`print-brackets Y/n`"
  case $input in
    y )
      __lib::print-color 'Yes\n' "$fg[main]"
      return 0
      ;;
    * )
      __lib::print-color 'no\n' "$fg[main]"
      return 1
      ;;
  esac
}

__lib::spinner() {
  private msg="$1" cmd="$2" space="`__lib::print-space $3`"
  private -a spinner
  spinner=(
    '\u280b' '\u2819' '\u2839' '\u2838' '\u283c'
    '\u2834' '\u2826' '\u2827' '\u2807' '\u280f'
  )

  set +m
  { $=cmd } >/dev/null 2>&1 &
  while :; do
    for s in $spinner; do
      printf "\r%s%s %s" "$space" "`__lib::print-color-bold "$s" "$fg[main]"`" "$msg"
      sleep 0.05
      if ! jobs %% > /dev/null 2>&1; then
        if wait $!; then
          printf "\r%s%s %s\n" "$space" "`__lib::print-mark success`" "$msg"
          set -m
          return 0
        else
          printf "\r%s%s %s\n" "$space" "`__lib::print-mark error`" "$msg"
          set -m
          return 1
        fi
      fi
    done
  done
}
