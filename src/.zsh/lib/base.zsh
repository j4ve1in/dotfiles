has() { type $1 >/dev/null 2>&1; }

is-alpine() { [ -e /etc/alpine-release ]; }

is-arch() { [ -e /etc/arch-release ]; }

is-darwin() { [[ $OSTYPE =~ darwin ]]; }

is-linux() { [[ $OSTYPE =~ linux ]]; }

prompt() {
  print-color-bold "$3? " "$fg[main]"
  [[ $2 ]] && printf "$2\n$3  "
  printf "$1? %s " "`print-brackets Y/n`"
  tput cnorm
  read -q input
  tput civis
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
  ${=cmd} >/dev/null 2>&1 &
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
