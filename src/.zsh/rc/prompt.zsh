# Prompt
has() { type $1 >/dev/null 2>&1; }
setopt prompt_subst
## Colors
declare -A fg
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

declare -A git
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

        local ahead behind stash
        local -a gitstatus

        ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
        (( $ahead )) && gitstatus+=("${fg[sub1]}+${ahead}%f")

        behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
        (( $behind )) && gitstatus+=("%F{red}-${behind}%f")

        gitstatus=("`echo ${(j:/:)gitstatus} | sed -e \"s|/|${fg[sub2]}/%f|g\"`")

        stash=$(git stash list 2>/dev/null | wc -l)
        (( $stash )) && gitstatus+=("${fg[sub2]}($stash stashed)%f")

        [ -n "$gitstatus" ] && hook_com[misc]=" ${gitstatus[@]}"
    }
fi

add-zsh-hook precmd vcs_info
vcs_info_msg='${vcs_info_msg_0_}${vcs_info_msg_1_}'
PROMPT+="%f${vcs_info_msg}%f"

## Separator
PROMPT+="${fg[main]}][%f"

## Time
re-prompt() { zle .reset-prompt; zle .accept-line; }
zle -N accept-line re-prompt
PROMPT+="%D{%m/%d %H:%M:%S}"

## Separator
PROMPT+="${fg[main]}]%f"

# Others
PROMPT+=$'\n'"%B%(!.#.%%)%b "
