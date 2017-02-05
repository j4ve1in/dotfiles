#!/bin/zsh

typeset -g AUTHOR=ytet5uy4 LICENSE=MIT
export XDG_DATA_HOME=~/.local/share

# dctl
export DOT_REPO=https://github.com/ytet5uy4/dotfiles
export DOT_ROOT=~/.local/src/github.com/ytet5uy4/dotfiles
export DCTL_PATH=$DOT_ROOT/src

# color
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
)

typeset -gA attr=(
  default   '0'
  bold      '1'
  underline '4'
)

# others
export ZPLUG_HOME=$XDG_DATA_HOME/zsh/plugins

typeset -gA opt
while (( $# > 0 )); do
  case "$1" in
    -*)
      [[ "$1" =~ 'y' ]] && opt[yes]='1'
      shift
      ;;
    *) shift ;;
  esac
done

main() {
  print-intro

  # check dotfiles
  if [[ -d $DOT_ROOT ]]; then
    echo "   destination path '$DOT_ROOT' already exists"
    exit 1
  fi

  # check git command
  if ! type git >/dev/null 2>&1; then
    echo '   Please install git or update your path to run git command'
    exit 1
  fi

  if ! (( $opt[yes] )); then
    prompt "Are you sure you want to continue" '   ' || exit 0
  fi

  # Download zplug and dctl
  print-header 'Download dctl and zplug'
  cmd="git clone https://github.com/zplug/zplug $ZPLUG_HOME"
  spinner 'Clone and init zplug' "$cmd" ' '
  . $ZPLUG_HOME/init.zsh
  zplug 'ytet5uy4/dctl'
  spinner "Clone dctl with zplug" 'zplug install' ' '
  zplug load
  echo

  # Download, deploy and backup dotfiles
  dctl -i $DOT_REPO
  echo

  # Restart
  if [[ $SHELL:t = zsh ]]; then
    clear
    $SHELL -l
  fi
}

print-intro() {
  clear
  private color="\e[$attr[bold];$text[fg];5;$fg[main]m"
  private reset="\e[0m"

  printf  "\n$color"
  <<<     '          __        __   ____ __ __              '
  <<<     '     ____/ /____   / /_ / __//_// /___   _____   '
  <<<     '    / __  // __ \ / __// /_ / // // _ \ / ___/   '
  <<<     '   / /_/ // /_/ // /_ / __// // //  __//__  /    '
  <<<     '   \__,_/ \____/ \__//_/  /_//_/ \___//____/     '
  printf  "$reset\n"

  print-color-bold  "           $DOT_REPO   \n\n" "$fg[sub]"

  print-section 'Author' "$AUTHOR" '   '
  print-section 'License' "$LICENSE\n" '     '

  echo
}

prompt() {
  private msg="$1" space="$2"
  print-prompt "$msg" "$space"
  read -q input
  printf '\b'
  case $input in
    y )
      print-color 'Yes\n\n' "$fg[main]"
      return 0
      ;;
    * )
      print-color 'no\n\n' "$fg[main]"
      return 1
      ;;
  esac
}

print-prompt() {
  private msg="$1" space="$2"
  print-color-bold "$space? " "$fg[main]"
  printf "$msg? "
  private str=''
  str+=`print-color-underline 'Y' "$fg[main]"`
  str+=`print-color '/' "$fg[main]"`
  str+=`print-color-underline 'n' "$fg[main]"`
  print-brackets "$str" "$fg[sub]"
  printf ' '
}

print-brackets() {
  print-color-bold '[' "$2"
  printf '%s' "$1"
  print-color-bold ']' "$2"
}

print-section() {
  printf "$3"
  print-color-bold "$1" "$fg[main]"
  print-color-bold ': ' "$fg[accent]"
  printf "$2"
}

print-color() {
  private string="$1" reset="\e[$attr[default]m"

  private color="\e["
  [[ -n $3 ]] && color+="$3" || color+="$attr[default]"
  color+=";$text[fg];5;${2}m"

  printf "%b%b%b" "$color" "$string" "$reset"
}

print-color-bold() {
  print-color "$1" "$2" "$attr[bold]"
}

print-color-underline() {
  print-color "$1" "$2" "$attr[underline]"
}

print-header() {
  print-color-bold ":: " "$fg[accent]"
  <<< "$1"
}

print-mark() {
  if [[ $1 = success ]]; then
    print-color-bold "\u2714" "$fg[success]"
  elif [[ $1 = error ]]; then
    print-color-bold "\u2716" "$fg[error]"
  fi
}

spinner() {
  private msg="$1" cmd="$2" space="$3"
  private -a spinner
  spinner=(
    '\u280b' '\u2819' '\u2839' '\u2838' '\u283c'
    '\u2834' '\u2826' '\u2827' '\u2807' '\u280f'
  )

  ${=cmd} >/dev/null 2>&1 &
  while :; do
    for s in $spinner; do
      printf "\r%s%s %s" "$space" "`print-color-bold "$s" "$fg[main]"`" "$msg"
      sleep 0.05
      if ! jobs %% > /dev/null 2>&1; then
        if wait $!; then
          printf "\r%s%s %s\n" "$space" "`print-mark success`" "$msg"
          return 0
        else
          printf "\r%s%s %s\n" "$space" "`print-mark error`" "$msg"
          return 1
        fi
      fi
    done
  done
}

main
