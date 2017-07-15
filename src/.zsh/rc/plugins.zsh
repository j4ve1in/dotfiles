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
    zplug 'zdharma/fast-syntax-highlighting', defer:2

    if ! zplug check; then
      if __lib::prompt 'Would you like to install plugins of zsh'; then
        private n=$(
          __lib::print-color-bold "$(zplug check --verbose | wc -l)" "$fg[main]"
        )
        __lib::spinner "Clone $n plugins with zplug" 'zplug install' 1
      fi
    fi

    zplug load

    if zplug check 'zsh-users/zsh-autosuggestions'; then
      unset ZSH_AUTOSUGGEST_ACCEPT_WIDGETS
      bindkey '^Y' autosuggest-accept
    fi

    if zplug check 'zdharma/fast-syntax-highlighting'; then
      FAST_HIGHLIGHT_STYLES[default]=none
      FAST_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
      FAST_HIGHLIGHT_STYLES[reserved-word]=fg=blue
      FAST_HIGHLIGHT_STYLES[alias]=fg=39,bold
      FAST_HIGHLIGHT_STYLES[builtin]=fg=111,bold
      FAST_HIGHLIGHT_STYLES[function]=fg=87,bold
      FAST_HIGHLIGHT_STYLES[command]=fg=27
      FAST_HIGHLIGHT_STYLES[precommand]=fg=cyan,underline
      FAST_HIGHLIGHT_STYLES[commandseparator]=129
      FAST_HIGHLIGHT_STYLES[hashed-command]=fg=cyan
      FAST_HIGHLIGHT_STYLES[path]=fg=$fg[main],bold
      FAST_HIGHLIGHT_STYLES[path_prefix]=none
      FAST_HIGHLIGHT_STYLES[path_approx]=none
      FAST_HIGHLIGHT_STYLES[globbing]=fg=51
      FAST_HIGHLIGHT_STYLES[history-expansion]=fg=blue
      FAST_HIGHLIGHT_STYLES[single-hyphen-option]=none
      FAST_HIGHLIGHT_STYLES[double-hyphen-option]=none
      FAST_HIGHLIGHT_STYLES[back-quoted-argument]=none
      FAST_HIGHLIGHT_STYLES[single-quoted-argument]=fg=250
      FAST_HIGHLIGHT_STYLES[double-quoted-argument]=fg=245
      FAST_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=cyan
      FAST_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=cyan
      FAST_HIGHLIGHT_STYLES[assign]=none
    fi

    if zplug check 'ytet5uy4/fzf-widgets'; then
      bindkey '^@'   fzf-select-widget
      bindkey '^@.'  fzf-edit-dotfiles
      bindkey '^@c'  fzf-change-directory
      bindkey '^@f'  fzf-edit-files
      bindkey '^@k'  fzf-kill-processes
      bindkey '^\'   fzf-change-recent-directory
      bindkey '^r'   fzf-insert-history
      bindkey '^xd'  fzf-insert-directory
      bindkey '^xf'  fzf-insert-files
      bindkey '^xs'  fzf-insert-snippet
      bindkey '^@s'  fzf-exec-snippet
      bindkey '^s'   fzf-copy-snippet

      # Git
      bindkey '^@g'  fzf-select-git-widget
      bindkey '^@ga' fzf-git-add-files
      bindkey '^@gc' fzf-git-change-repository

      # GitHub
      bindkey '^@h'  fzf-select-github-widget
      bindkey '^@hs' fzf-github-show-issue
      bindkey '^@hc' fzf-github-close-issue

      # Docker
      bindkey '^@d'  fzf-select-docker-widget
      bindkey '^@dc' fzf-docker-remove-containers
      bindkey '^@di' fzf-docker-remove-images
      bindkey '^@dv' fzf-docker-remove-volumes
    fi
  fi
}
