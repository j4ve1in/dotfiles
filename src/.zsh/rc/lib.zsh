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

print-space() { [[ $1 ]] && printf "%$1s" ' '; }

print-header() { print-color-bold ":: " "$fg[accent]" && <<< "$1"; }

print-color() {
  private string="$1" reset="\e[$attr[default]m"

  private color
  if [[ -n $3 ]]; then
    color="\e[${3};$text[fg];5;${2}m"
  else
    color="\e[$attr[default];$text[fg];5;${2}m"
  fi

  printf "%b%b%b" "$color" "$string" "$reset"
}

print-color-bold() { print-color "$1" "$2" "$attr[bold]"; }

print-mark() {
  if [[ $1 = success ]]; then
    print-color-bold '\u2713' "$fg[success]"
  elif [[ $1 = error ]]; then
    print-color-bold '\u2715' "$fg[error]"
  fi
}

print-brackets() {
  if [[ $1 = Y/n ]]; then
    print-color-bold '[' "$fg[sub]"
    print-color 'Y' "$fg[main]" "$attr[underline]"
    print-color '/' "$fg[main]"
    print-color 'n' "$fg[main]" "$attr[underline]"
    print-color-bold ']' "$fg[sub]"
  else
    print-color-bold '[' "$fg[accent]"
    printf "$1"
    print-color-bold ']' "$fg[accent]"
  fi
}

prompt() {
  print-color-bold "$3? " "$fg[main]"
  [[ $2 ]] && printf "$2\n$3  "
  printf "$1? %s " "`print-brackets Y/n`"
  echoti cnorm
  read -q input
  echoti civis
  [[ $2 ]] && printf "\r$3  " || print-color-bold "\r$3? " "$fg[main]"
  printf "$1? %s " "`print-brackets Y/n`"
  case $input in
    y )
      print-color 'Yes\n' "$fg[main]"
      return 0
      ;;
    * )
      print-color 'no\n' "$fg[main]"
      return 1
      ;;
  esac
}

spinner() {
  private msg="$1" cmd="$2" space="`print-space $3`"
  private -a spinner
  spinner=(
    '\u280b' '\u2819' '\u2839' '\u2838' '\u283c'
    '\u2834' '\u2826' '\u2827' '\u2807' '\u280f'
  )

  set +m
  { $=cmd } >/dev/null 2>&1 &
  while :; do
    for s in $spinner; do
      printf "\r%s%s %s" "$space" "`print-color-bold "$s" "$fg[main]"`" "$msg"
      sleep 0.05
      if ! jobs %% > /dev/null 2>&1; then
        if wait $!; then
          printf "\r%s%s %s\n" "$space" "`print-mark success`" "$msg"
          set -m
          return 0
        else
          printf "\r%s%s %s\n" "$space" "`print-mark error`" "$msg"
          set -m
          return 1
        fi
      fi
    done
  done
}
