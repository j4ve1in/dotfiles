# Prompt
has() { type $1 >/dev/null 2>&1; }
setopt prompt_subst
## Colors
MAIN_COLOR="%{`echo '\e[0;34m'`%}" # Blue
SUB_COLOR1="%{`echo '\e[0;38;05;75m'`%}"  # Skyblue
SUB_COLOR2="%{`echo '\e[0;38;05;243m'`%}"  # Gray
SUB_COLOR3="%{`echo '\e[0;38;05;99m'`%}"  # purple
RESET_COLOR='%{$reset_color%}' # Reset

## Separator
PROMPT="${MAIN_COLOR}[$RESET_COLOR"

## Username and Hostname, Directoryname, sshinfo
PROMPT+="%n@%m"
[ -n "$SSH_CLIENT" ] && ssh+=":ssh-session"
PROMPT+=" %1~"

## VCS
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
autoload -Uz is-at-least

declare -A PROMPT_GIT
if has powerilne; then
  PROMPT_GIT=(
    BRANCH `echo "\ue0a0"`
    CLEAN `echo "\u2714"`
    STAGED `echo "\uf111"`
    UNSTAGED `echo "\uf067"`
    UNTRACKED '?'
    UNMARGED `echo "\u2714"`
  )
else
  PROMPT_GIT=(
    BRANCH '<'
    CLEAN '-'
    STAGED '+'
    UNSTAGED '-'
    UNTRACKED '?'
    UNMARGED '-'
  )
fi

if is-at-least 4.3.10; then
  zstyle ':vcs_info:git:*' max-exports 3
  zstyle ':vcs_info:git:*' enable git
  zstyle ':vcs_info:git:*' formats " ${SUB_COLOR2}${PROMPT_GIT[BRANCH]} %b%f" '%c%u%m'
  zstyle ':vcs_info:git:*' actionformats " ${SUB_COLOR2}${PROMPT_GIT[BRANCH]}%f %b" '%c%u%m' '!%a'
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "${SUB_COLOR1}${PROMPT_GIT[STAGED]}%f"
  zstyle ':vcs_info:git:*' unstagedstr "%F{red}${PROMPT_GIT[UNSTAGED]}%f"
fi

if is-at-least 4.3.11; then
    zstyle ':vcs_info:git+set-message:*' hooks \
                                            git-hook-begin \
                                            git-untracked \
                                            git-status

    +vi-git-hook-begin() {
        if [[ $(command git rev-parse --is-inside-work-tree 2> /dev/null) != 'true' ]]; then
            return 1
        fi

        return 0
    }

    +vi-git-untracked() {
        [[ "$1" != "1" ]] && return 0

        if command git status --porcelain 2> /dev/null \
            | awk '{print $1}' \
            | command grep -F '??' > /dev/null 2>&1 ; then

            hook_com[unstaged]+="${SUB_COLOR3}${PROMPT_GIT[UNTRACKED]}%f"
        fi
    }

    +vi-git-status() {
        [[ "$1" != "1" ]] && return 0

        local ahead behind stash
        local -a gitstatus

        ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
        (( $ahead )) && gitstatus+=("${SUB_COLOR1}+${ahead}%f")

        behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
        (( $behind )) && gitstatus+=("%F{red}-${behind}%f")

        gitstatus=("`echo ${(j:/:)gitstatus} | sed -e \"s|/|${SUB_COLOR2}/%f|g\"`")

        stash=$(git stash list 2>/dev/null | wc -l)
        (( $stash )) && gitstatus+=("${SUB_COLOR2}($stash stashed)%f")

        [ -n "$gitstatus" ] && hook_com[misc]=" ${gitstatus[@]}"
    }
fi

precmd () { vcs_info }
vcs_info='${vcs_info_msg_0_}${vcs_info_msg_1_}${vcs_info_msg_2_}'
PROMPT+="${RESET_COLOR}${vcs_info}$RESET_COLOR"

## Separator
PROMPT+="${MAIN_COLOR}][$RESET_COLOR"

## Time
re-prompt() { zle .reset-prompt; zle .accept-line; }
zle -N accept-line re-prompt
PROMPT+="%D{%m/%d %H:%M:%S}"

## Separator
PROMPT+="$MAIN_COLOR"
PROMPT+="]$RESET_COLOR"

# Others
PROMPT+="
%B%(!.#.%%)%b "
