: "Plugin" && () {
  if [ -d $XDG_DATA_HOME/zsh/zplug ]; then
    # Zplug
    typeset -a ZPLUG_PLUGINS
    ZPLUG_PLUGINS=(
      'zplug/zplug'
      'ytet5uy4/pctl'
      'ytet5uy4/dctl'
      'Tarrasch/zsh-bd'
      'b4b4r07/zsh-gomi'
      'mollifier/cd-gitroot'
      'zsh-users/zsh-completions'
      'zsh-users/zsh-syntax-highlighting, nice:10'
      'junegunn/fzf-bin, as:command, from:gh-r, rename-to:fzf'
      'junegunn/fzf, as:command, use:bin/fzf-tmux'
      'junegunn/fzf, use:shell'
    )

    export ZPLUG_HOME="$XDG_DATA_HOME/zsh/zplug"
    export ZPLUG_CACHE_FILE="$XDG_CACHE_HOME/zsh/zplug/cache"

    export GOMI_DIR=$XDG_DATA_HOME/gomi

    . $ZPLUG_HOME/init.zsh
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
      fpath=( $fpath $ZPLUG_REPOS/mollifier/cd-gitroot(N-/) )
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

      type tmux >/dev/null 2>&1 && export SELECTOR='fzf-tmux'
      [ -z "$TMUX" ] && export SELECTOR='fzf'

      autoload -Uz selector-init && selector-init

      bindkey '^@' fzf-select-widget

      bindkey '^@c' fzf-cd-dir-widget

      bindkey '^@e' fzf-edit-files-widget

      bindkey '^@d' fzf-edit-dotfiles-widget

      bindkey '^@g' fzf-cd-ghq-repository-widget

      bindkey '^\' fzf-cdr-widget

      bindkey '^r' fzf-excute-history-widget

      bindkey '^@ga' fzf-git-add-widget

      bindkey '^@gb' fzf-checkout-git-branch-widget

      bindkey '^@l' fzf-lpass-bookmark-widget

      bindkey '^@n' fzf-switch-network-widget

      bindkey '^@s' fzf-ssh-widget
    fi
  fi

  COMMAND_NOT_FOUND='/usr/share/doc/pkgfile/command-not-found.zsh'
  [ -f "$COMMAND_NOT_FOUND" ] && source $COMMAND_NOT_FOUND
}
