: "Prompt" && () {
  typeset -g PROMPT
  has() { type $1 >/dev/null 2>&1; }
  setopt prompt_subst
  ## Colors
  typeset -A fg
  fg=(
    main "%{`echo '\e[0;34m'`%}"        # Blue
    sub1 "%{`echo '\e[0;38;05;75m'`%}"  # Skyblue
    sub2 "%{`echo '\e[0;38;05;243m'`%}" # Gray
    sub3 "%{`echo '\e[0;38;05;99m'`%}"  # Purple
    sub4 "%{`echo '\e[0;38;05;48m'`%}"  # Green
  )
  
  ## Separator
  PROMPT="${fg[main]}[%f"
  
  ## Username and Hostname, Directoryname, sshinfo
  PROMPT+="%n@%m"
  [ -n "$SSH_CLIENT" ] && PROMPT+=":ssh-session"
  PROMPT+=" %1~"
  
  ## VCS
  autoload -Uz vcs_info
  autoload -Uz add-zsh-hook
  autoload -Uz is-at-least
  
  typeset -A git
  if has powerilne; then
    git=(
      branch `echo "\ue0a0"`
      clean `echo "\u2714"`
      unstaged `echo "\uf067"`
      untracked '?'
      staged `echo "\uf111"`
      action '!'
    )
  else
    git=(
      branch '<'
      clean '-'
      unstaged '-'
      untracked '?'
      staged '+'
      action '!'
    )
  fi
  
  if is-at-least 4.3.10; then
    zstyle ':vcs_info:git:*' max-exports 3
    zstyle ':vcs_info:git:*' enable git
    zstyle ':vcs_info:git:*' formats " ${fg[sub2]}${git[branch]} %b%f" '%u%c%m'
    zstyle ':vcs_info:git:*' actionformats " ${fg[sub2]}${git[branch]} %b%f" "%u%c%F{red}${git[action]}%f%m"
    zstyle ':vcs_info:git:*' check-for-changes true
    zstyle ':vcs_info:git:*' stagedstr "${fg[sub1]}${git[staged]}%f"
    zstyle ':vcs_info:git:*' unstagedstr "${fg[sub4]}${git[unstaged]}%f"
  fi
  
  if is-at-least 4.3.11; then
    zstyle ':vcs_info:git+set-message:*' hooks \
                                            git-hook-begin \
                                            git-untracked \
                                            git-misc
  
    autoload -Uz git-hook
  fi
  
  add-zsh-hook precmd vcs_info
  local vcs_info_msg
  vcs_info_msg='${vcs_info_msg_0_}${vcs_info_msg_1_}'
  PROMPT+="%f${vcs_info_msg}%f"
  
  ## Separator
  PROMPT+="${fg[main]}][%f"
  
  ## Time
  autoload -Uz re-prompt
  zle -N accept-line re-prompt
  PROMPT+="%D{%m/%d %H:%M:%S}"
  
  ## Separator
  PROMPT+="${fg[main]}]%f"
  
  # Others
  PROMPT+=$'\n'"%(!.#.%%) "
}
