# Prompt
setopt prompt_subst
## Colors
MAIN_COLOR="%{`echo \"\033[1;34m\"`%}" # Blue
SUB_COLOR1="%{`echo \"\033[1;38;05;75m\"`%}"  # Skyblue
SUB_COLOR2="%{`echo \"\033[1;38;05;245m\"`%}"  # Gray
RESET_COLOR='%{$reset_color%}' # Reset

# set PROMPT
PROMPT=""
## Bracket
PROMPT+="$MAIN_COLOR"
PROMPT+="[$RESET_COLOR"

## Username and Hostname, Directoryname
[ -n "$SSH_CLIENT" ] && ssh=":ssh-session"
PROMPT+="%n@%m$ssh %1~"

## VCS
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
autoload -Uz is-at-least
PROMPT_GIT_BRANCH=`echo "\ue0a0"`
PROMPT_GIT_CLEAN=`echo "\u2714"`
PROMPT_GIT_STAGED=`echo "\u25CF"`
PROMPT_GIT_UNSTAGED=`echo "\u271A"`
PROMPT_GIT_UNMARGED=`echo "\u2714"`
zstyle ':vcs_info:*' formats " ${SUB_COLOR2}${PROMPT_GIT_BRANCH} %b%f%c%u"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
if is-at-least 4.3.10; then
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "%F{yellow}${PROMPT_GIT_STAGED}"
  zstyle ':vcs_info:git:*' unstagedstr " %F{red}${PROMPT_GIT_UNSTAGED}"
fi
precmd () { vcs_info }
vcs_info='${vcs_info_msg_0_}'
PROMPT+="${RESET_COLOR}${vcs_info}$RESET_COLOR"

## Bracket
PROMPT+="$MAIN_COLOR"
PROMPT+="][$RESET_COLOR"

## Time
re-prompt() {
  zle .reset-prompt
  zle .accept-line
}
zle -N accept-line re-prompt
PROMPT+="%D{%m/%d %H:%M:%S}"

## Bracket
PROMPT+="$MAIN_COLOR"
PROMPT+="]$RESET_COLOR"

# Others
PROMPT+="
%B%(!.#.%%)%b "
