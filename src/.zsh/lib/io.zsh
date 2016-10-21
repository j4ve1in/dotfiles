print-space() { [[ $1 ]] && printf "%$1s" ' '; }

print-log() { print-brackets "$1/$2" && print-section " $3" "$4"; }

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

print-section() {
  printf "$3"
  print-color-bold "$1" "$fg[main]"
  print-color-bold ': ' "$fg[accent]"
  <<< "$2"
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
