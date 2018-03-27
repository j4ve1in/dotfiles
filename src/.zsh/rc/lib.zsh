# color
local -A fg
fg=(
  main    $'%{\e[1;38;05;27m%}'  # Blue
  sub1    $'%{\e[0;38;05;75m%}'  # Skyblue
  sub2    $'%{\e[0;38;05;243m%}' # Gray
  sub3    $'%{\e[0;38;05;99m%}'  # Purple
  sub4    $'%{\e[0;38;05;48m%}'  # Green
  sub5    $'%{\e[1;38;05;75m%}'  # skyblue2
)

# io
__abyss::io::color() {
  local -A color
  color=(
    main '27'
    sub  '243'
  )
  case $1 in
    default) printf '%b' $'%{\e[0m%}' ;;
    fg )     printf '%b' "%{\e[0;38;05;${color[$2]}m%}" ;;
    bg )     printf '%b' "%{\e[0;48;05;$color[$3]m%}" ;;
  esac
}

__abyss::io::print::color() {
  local string="$1"

  [[ -n $2 ]] && local fg="`__abyss::io::color fg $2`" || local fg=''
  [[ -n $3 ]] && local bg="`__abyss::io::color bg $3`" || local bg=''
  local default="`__abyss::io::color default`"

  printf "%b%b%b%b" "$fg" "$bg" "$string" "$default"
}

# prompt
__abyss::prompt::path() {
  setopt localoptions noksharrays extendedglob
  local MATCH MBEGIN MEND
  local -a match mbegin mend
  __abyss::io::print::color ${${PWD/$HOME/'~'}//(#m)[^\/]##\//${MATCH/(#b)([^.])*/$match[1]}/} sub
}

__abyss::prompt::vcs::git() {
  echo "$vcs_info_msg_0_$vcs_info_msg_1_"
}

__abyss::prompt::symbol() {
  [[ $DISPLAY ]] && mark="`echo '\u25b6'`" || mark='>'
  __abyss::io::print::color "$mark$mark$mark " main
}

# git
autoload -Uz vcs_info
autoload -Uz is-at-least

local -A git
git=(
  clean '-'
  unstaged '-'
  untracked '?'
  staged '+'
  action '!'
)
[[ $DISPLAY ]] && git[branch]=$'\ue0a0' || git[branch]='<'

if is-at-least 4.3.10; then
  zstyle ':vcs_info:git:*' max-exports 3
  zstyle ':vcs_info:git:*' enable git
  zstyle ':vcs_info:git:*' formats " $fg[sub2]$git[branch] %b%f" '%u%c%m'
  zstyle ':vcs_info:git:*' actionformats " $fg[sub2]$git[branch] %b%f" "%u%c%F{red}$git[action]%f%m"
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "$fg[sub1]$git[staged]%f"
  zstyle ':vcs_info:git:*' unstagedstr "$fg[sub4]$git[unstaged]%f"
fi

if is-at-least 4.3.11; then
  local git_hook_func=( hooks git-hook-begin git-untracked git-misc )
  zstyle ':vcs_info:git+set-message:*' $git_hook_func
fi

autoload -Uz add-zsh-hook
add-zsh-hook precmd vcs_info

+vi-git-hook-begin() {
  git rev-parse --is-inside-work-tree >/dev/null 2>&1 && return 0 || return 1
}

+vi-git-untracked() {
  [ "$1" != "1" ] && return 0

  if git status --porcelain 2>/dev/null \
    | awk '{print $1}' \
    | grep -F '??' >/dev/null 2>&1; then
    hook_com[unstaged]+="${fg[sub3]}${git[untracked]}%f"
  fi
}

+vi-git-misc() {
  [ "$1" != "1" ] && return 0

  private ahead behind stash
  private -a gitstatus

  ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
  (( $ahead )) && gitstatus+=("${fg[sub1]}+${ahead}%f")

  behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
  (( $behind )) && gitstatus+=("%F{red}-${behind}%f")

  gitstatus=("`echo ${(j:/:)gitstatus} | sed -e \"s|/|${fg[sub2]}/%f|g\"`")

  stash=$(git stash list 2>/dev/null | wc -l)
  (( $stash )) && gitstatus+=("${fg[sub2]}($stash stashed)%f")

  [ -n "$gitstatus" ] && hook_com[misc]=" ${gitstatus[@]}"
}
