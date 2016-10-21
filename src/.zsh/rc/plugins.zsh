: "Plugin" && () {
  zplug-init() {
    export ZPLUG_HOME=$XDG_DATA_HOME/zsh/zplug
    export ZPLUG_CACHE_FILE=$XDG_CACHE_HOME/zsh/zplug/cache

    export GOMI_DIR=$XDG_DATA_HOME/gomi

    . $ZPLUG_HOME/init.zsh

    private -a zplug_args
    zplug_args=(
      'zplug/zplug'
      'ytet5uy4/pctl'
      'ytet5uy4/dctl'
      'b4b4r07/zsh-gomi'
      'zsh-users/zsh-completions'
      'zsh-users/zsh-syntax-highlighting, nice:10'
      'junegunn/fzf-bin, as:command, from:gh-r, rename-to:fzf'
      'junegunn/fzf, as:command, use:bin/fzf-tmux'
    )
    for arg in $zplug_args; do zplug $arg; done
  }

  if [[ ! -f $XDG_CACHE_HOME/zsh/plugin ]]; then
    touch $XDG_CACHE_HOME/zsh/plugin
    if prompt 'Would you like to install plugins of zsh'; then
      private cmd="git clone https://github.com/zplug/zplug $XDG_DATA_HOME/zsh/zplug"
      spinner 'Clone and init zplug' "$cmd" 1
      zplug-init
      private n=$(print-color-bold "$(zplug list | wc -l)" "$fg[main]")
      spinner "Clone $n plugins with zplug" 'zplug install' 1
    else
      return 1
    fi
  fi

  if [[ -d $XDG_DATA_HOME/zsh/zplug ]]; then
    # Zplug
    zplug-init

    if ! zplug check; then
      print-header 'Check plugin status of zsh'
      zplug check --verbose | sed -e 's/^/ /g'
      if prompt 'Would you like to install plugins of zsh'; then
        spinner 'Download plugins with zplug' 'zplug install' 1
      else
        return 1
      fi
    fi

    zplug load

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
      ZSH_HIGHLIGHT_STYLES[path]=fg=$fg[main],bold
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

      has tmux && export SELECTOR='fzf-tmux'
      [[ -z $TMUX ]] && export SELECTOR='fzf'

      bindkey '^@' selector-select-widget
      bindkey '^@c' selector-cd-dir-widget
      bindkey '^@e' selector-edit-files-widget
      bindkey '^@d' selector-edit-dotfiles-widget
      bindkey '^@g' selector-cd-ghq-repository-widget
      bindkey '^\' selector-cdr-widget
      bindkey '^r' selector-excute-history-widget
      bindkey '^@ga' selector-git-add-widget
      bindkey '^@gb' selector-checkout-git-branch-widget
      bindkey '^@p' selector-copy-password-widget
      bindkey '^@n' selector-switch-network-widget
      bindkey '^@s' selector-ssh-widget
      bindkey '^@z' selector-cd-zsh-plugin-dir-widget
    fi
  fi
}
