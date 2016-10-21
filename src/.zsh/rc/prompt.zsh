: "Prompt" && () {
  typeset -g PROMPT
  setopt prompt_subst
  ## Colors
  private -A fg
  fg=(
    default $'%{\e[0m%}'
    main    $'%{\e[0;38;05;27m%}'  # Blue
    sub1    $'%{\e[0;38;05;75m%}'  # Skyblue
    sub2    $'%{\e[0;38;05;243m%}' # Gray
    sub3    $'%{\e[0;38;05;99m%}'  # Purple
    sub4    $'%{\e[0;38;05;48m%}'  # Green
    sub5    $'%{\e[1;38;05;75m%}'  # skyblue2
  )

  ## Separator
  PROMPT="${fg[main]}[%f"

  ## Username and Hostname, Directoryname, sshinfo
  PROMPT+="%n${fg[sub2]}@%f%m"
  [[ -n $SSH_CLIENT ]] && PROMPT+="${fg[sub2]}:ssh%f"
  PROMPT+=" %1~"

  ## VCS
  autoload -Uz vcs_info
  autoload -Uz is-at-least

  private -A git
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
    private git_hook_func=( hooks git-hook-begin git-untracked git-misc )
    zstyle ':vcs_info:git+set-message:*' $git_hook_func
  fi

  add-zsh-hook precmd vcs_info
  local vcs_info_msg
  vcs_info_msg='$vcs_info_msg_0_$vcs_info_msg_1_'
  PROMPT+="%f$vcs_info_msg%f"

  ## Separator
  PROMPT+="${fg[main]}][%f"

  ## Time
  zle -N accept-line re-prompt
  PROMPT+="%D{%m}${fg[sub2]}/%f%D{%d}"
  PROMPT+=" "
  PROMPT+="%D{%H}${fg[sub2]}:%f%D{%M}${fg[sub2]}:%f%D{%S}"

  ## Separator
  PROMPT+="${fg[main]}]%f"

  # Others
  PROMPT+=$'\n'"${fg[sub5]}%(!.#.%%)$fg[default] "
}
