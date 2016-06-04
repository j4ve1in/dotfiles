if [ -d ~/.zsh/bundle/zplug ]; then
  # Zplug
  ZPLUG_HOME="$HOME/.zsh/bundle/"
  ZPLUG_REPOS="$HOME/.zsh/bundle/repos/"
  ZPLUG="${ZPLUG_HOME}zplug/zplug"
  ZPLUG_PLUGINS=(
    'b4b4r07/zplug'
    'Tarrasch/zsh-bd'
    'mollifier/cd-gitroot'
    'zsh-users/zsh-completions'
    'zsh-users/zsh-syntax-highlighting, nice:10'
    'b4b4r07/zsh-gomi, as:command, use:bin/gomi'
    'junegunn/fzf-bin, as:command, from:gh-r, file:fzf'
    'junegunn/fzf, as:command, use:bin/fzf-tmux'
    'junegunn/fzf, use:shell'
  )

  . $ZPLUG
  for plugin in ${ZPLUG_PLUGINS[@]}; do
    zplug "$plugin" >/dev/null 2>&1
  done

  local SKYBLUE="\e[1;38;05;75m"
  cprintf() {
    local color="$1" string="$2" reset="\e[0m"
    printf "${color}${string}${reset}"
  }
  if ! zplug check; then
    cprintf $SKYBLUE "Check plugin status of zsh\n"
    zplug check --verbose | sed -e 's/^/ /g'
    printf ' Would you like to install (yes/no)? '
    read -q ANSWER
    echo
    [[ "$ANSWER" =~ Y\|y ]] && zplug install | sed -e 's/^/  /g'
    echo
  fi

  zplug load

  # cd-gitroot
  if zplug check 'mollifier/cd-gitroot'; then
    fpath=(${ZPLUG_REPOS}/mollifier/cd-gitroot(N-/) $fpath)
    alias cdu='cd-gitroot'
  fi

  # Syntax-highlighting
  if zplug check 'zsh-users/zsh-syntax-highlighting'; then
    ZSH_HIGHLIGHT_STYLES[default]=none
    ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
    ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=blue
    ZSH_HIGHLIGHT_STYLES[alias]=fg=129,bold
    ZSH_HIGHLIGHT_STYLES[builtin]=fg=111,bold
    ZSH_HIGHLIGHT_STYLES[function]=fg=87,bold
    ZSH_HIGHLIGHT_STYLES[command]=fg=27
    ZSH_HIGHLIGHT_STYLES[precommand]=fg=cyan,underline
    ZSH_HIGHLIGHT_STYLES[commandseparator]=none
    ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=cyan
    ZSH_HIGHLIGHT_STYLES[path]=fg=75,bold
    ZSH_HIGHLIGHT_STYLES[path_prefix]=none
    ZSH_HIGHLIGHT_STYLES[path_approx]=none
    ZSH_HIGHLIGHT_STYLES[globbing]=fg=51
    ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue
    ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
    ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
    ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=250
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=245
    ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=cyan
    ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=cyan
    ZSH_HIGHLIGHT_STYLES[assign]=none
  fi

  zplug check 'b4b4r07/zsh-gomi' && alias gm=gomi

  if zplug check 'junegunn/fzf-bin'; then
    export FZF_DEFAULT_OPTS='
      --ansi
      --select-1
      --exit-0
      --extended
      --cycle
      --multi
      --color fg:15,bg:16,hl:27,fg+:15,bg+:21,hl+:75
      --color info:69,prompt:75,spinner:69,pointer:69,marker:69
    '

    type tmux >/dev/null 2>&1 && SELECTOR='fzf-tmux'
    [ -z "$TMUX" ] && SELECTOR='fzf'

    FZF_WIDGETS=(
      'edit-files'
      'cd-dir'
      'cd-ghq-repository'
      'cdr'
      'excute-history'
      'git-add'
      'checkout-git-branch'
    )
    fzf-select-widget() {
      widget=$(echo $FZF_WIDGETS | tr ' ' '\n' | $SELECTOR)
      [ -z "$widget" ] && return 1
      if zle; then
        BUFFER="fzf-${widget}-widget"
        CURSOR=$#BUFFER
        zle accept-line
        zle -R -c
      else
        print -z -f '%s' "fzf-${widget}-widget"
      fi
    }
    zle -N fzf-select-widget
    bindkey '^@' fzf-select-widget

    fzf-cd-dir-widget() {
      DIR=$(find * -type d | $SELECTOR)
      if [ -d "$DIR" ]; then
        if zle; then
          BUFFER="cd $DIR"
          CURSOR=$#BUFFER
          zle accept-line
          zle -R -c
        else
          print -z -f '%s' "cd $DIR"
        fi
      fi
    }
    zle -N fzf-cd-dir-widget
    bindkey '^@c' fzf-cd-dir-widget

    fzf-edit-files-widget() {
      FILES=($(find * -type f | $SELECTOR))
      [ -z "$FILES" ] && return 1
      for file in ${FILES[@]}; do
        [ ! -f "$file" ] && return 1
      done
      if zle; then
        BUFFER="$EDITOR ${FILES[@]}"
        CURSOR=$#BUFFER
        zle accept-line
        zle -R -c
      else
        print -z -f '%s' "$EDITOR ${FILES[@]}"
      fi
    }
    zle -N fzf-edit-files-widget
    bindkey '^@e' fzf-edit-files-widget

    fzf-cd-ghq-repository-widget() {
      REPO=($(ghq list --full-path | $SELECTOR))
      [ ! -d "$REPO" ] && return 1
      if zle; then
        BUFFER="cd -- $REPO"
        CURSOR=$#BUFFER
        zle accept-line
        zle -R -c
      else
        print -z -f '%s' "cd -- $REPO"
      fi
    }
    zle -N fzf-cd-ghq-repository-widget
    bindkey '^@g' fzf-cd-ghq-repository-widget

    fzf-cdr-widget() {
      autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
      add-zsh-hook chpwd chpwd_recent_dirs
      DIR=($(cdr -l | sed 's/^[^ ][^ ]*  *//' | $SELECTOR))
      [ -z "$DIR" ] && return 1
      if zle; then
        BUFFER="cd -- $DIR"
        CURSOR=$#BUFFER
        zle accept-line
        zle -R -c
      else
        print -z -f '%s' "cd -- $DIR"
      fi
    }
    zle -N fzf-cdr-widget
    bindkey '^\' fzf-cdr-widget

    fzf-excute-history-widget() {
      CMD=($(history -n -r 1 | awk '!a[$0]++' | $SELECTOR))
      [ -z "$CMD" ] && return 1
      if zle; then
        BUFFER="$CMD"
        CURSOR=$#BUFFER
        zle accept-line
        zle -R -c
      else
        print -z -f '%s' "$CMD"
      fi
    }
    zle -N fzf-excute-history-widget
    bindkey '^r' fzf-excute-history-widget

    fzf-git-add-widget() {
      local base_path="$(git rev-parse --show-cdup | sed 's%/%\\/%g')"
      FILES=($(git status --porcelain | sed "s/^\(..\) /\1\t${base_path}/" | grep "^.[MD?]" | $SELECTOR | awk '{print $2}'))
      [ -z "$FILES" ] && return 1
      for file in ${FILES[@]}; do
        [ ! -f "$file" ] && return 1
      done
      if zle; then
        BUFFER="git add -- ${FILES[@]}"
        CURSOR=$#BUFFER
        zle accept-line
        zle -R -c
      else
        print -z -f '%s' "git add -- ${FILES[@]}"
      fi
    }
    zle -N fzf-git-add-widget
    bindkey '^@ga' fzf-git-add-widget

    fzf-checkout-git-branch-widget() {
      git_option=("--list" "-v")
      BRANCH=($(git branch $git_option | grep -v '^\*' | sed 's/^  *//' | $SELECTOR | awk '{print $1}'))
      [ -z "$BRANCH" ] && return 1
      if zle; then
        BUFFER="git checkout $BRANCH"
        CURSOR=$#BUFFER
        zle accept-line
        zle -R -c
      else
        print -z -f '%s' "git checkout $BRANCH"
      fi
    }
    zle -N fzf-checkout-git-branch-widget
    bindkey '^@gb' fzf-checkout-git-branch-widget
  fi
fi
