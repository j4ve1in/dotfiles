: "Plugin" && () {
  if [[ -d $ZPLUG_HOME ]]; then
    # Zplug
    . $ZPLUG_HOME/init.zsh

    zplug 'zplug/zplug'
    zplug 'ytet5uy4/pctl'
    zplug 'ytet5uy4/dctl'
    zplug 'ytet5uy4/fzf-widgets'
    zplug 'ytet5uy4/abyss.zsh', as:theme
    zplug 'zsh-users/zsh-completions'
    zplug 'zsh-users/zsh-autosuggestions'
    zplug 'zsh-users/zsh-syntax-highlighting', defer:2

    if ! zplug check; then
      if prompt 'Would you like to install plugins of zsh'; then
        private n=$(print-color-bold "$(zplug check --verbose | wc -l)" "$fg[main]")
        spinner "Clone $n plugins with zplug" 'zplug install' 1
      fi
    fi

    zplug load >/dev/null 2>&1

    if zplug check 'zsh-users/zsh-autosuggestions'; then
      unset ZSH_AUTOSUGGEST_ACCEPT_WIDGETS
      bindkey '^Y' autosuggest-accept
    fi

    if zplug check 'zsh-users/zsh-syntax-highlighting'; then
      ZSH_HIGHLIGHT_STYLES[default]=none
      ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
      ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=blue
      ZSH_HIGHLIGHT_STYLES[alias]=fg=39,bold
      ZSH_HIGHLIGHT_STYLES[builtin]=fg=111,bold
      ZSH_HIGHLIGHT_STYLES[function]=fg=87,bold
      ZSH_HIGHLIGHT_STYLES[command]=fg=27
      ZSH_HIGHLIGHT_STYLES[precommand]=fg=cyan,underline
      ZSH_HIGHLIGHT_STYLES[commandseparator]=129
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

    if zplug check 'ytet5uy4/fzf-widgets'; then
      bindkey '^@'  fzf-select-widget
      bindkey '^@.' fzf-edit-dotfiles
      bindkey '^@c' fzf-change-directory
      bindkey '^@f' fzf-edit-files
      bindkey '^@k' fzf-kill-processes
      bindkey '^@s' fzf-exec-ssh
      bindkey '^\'  fzf-change-recent-directory
      bindkey '^r'  fzf-insert-history
      bindkey '^xf' fzf-insert-files
      bindkey '^xd' fzf-insert-directory

      # Git
      bindkey '^@g'  fzf-git-change-repository
      bindkey '^@ga' fzf-git-add-files
      bindkey '^@gc' fzf-git-checkout-branch
      bindkey '^@gd' fzf-git-delete-branches

      # Docker
      bindkey '^@d'   fzf-select-docker-widget
      bindkey '^@dk'  fzf-docker-kill-containers
      bindkey '^@dl'  fzf-docker-logs-container
      bindkey '^@dr'  fzf-docker-remove-containers
      bindkey '^@dri' fzf-docker-remove-images
      bindkey '^@drv' fzf-docker-remove-volumes
      bindkey '^@dsa' fzf-docker-start-containers
      bindkey '^@dso' fzf-docker-stop-containers
    fi
  fi
}
