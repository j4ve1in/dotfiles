# Prompt
setopt prompt_subst
## Colors
MAIN_COLOR='%{$fg[blue]%}' # Blue
SUB_COLOR1='%{[1;38;05;75m%}'  # Skyblue
SUB_COLOR2='%{[1;38;05;245m%}'  # Gray
RESET_COLOR='%{$reset_color%}' # Reset

## SSH
if [ -n "$SSH_CLIENT" ]; then
  ssh=":ssh-session"
fi

autoload -Uz vcs_info
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats " ${SUB_COLOR2}< %c%u%b%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
vcs_info='${vcs_info_msg_0_}'
PROMPT="${MAIN_COLOR}[%f"
PROMPT+="%n${SUB_COLOR1}@${RESET_COLOR}%m${ssh}"
PROMPT+=" %1~${RESET_COLOR}${vcs_info}${RESET_COLOR}"
PROMPT+="${MAIN_COLOR}]"
PROMPT+="[%f%D{%m/%d} %T${MAIN_COLOR}]"
PROMPT+="%f
%B%(!.#.%%)%b "

zmodload zsh/datetime
reset_tmout() { TMOUT=$[60-EPOCHSECONDS%60] }
precmd_functions=($precmd_functions reset_tmout)
redraw_tmout() { zle reset-prompt; reset_tmout }
TRAPALRM() { redraw_tmout }
