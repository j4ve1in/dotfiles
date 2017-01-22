: "Plugin" && () {
  private cmd

  if [[ ! -f $NVIM_CACHE_HOME/plugin ]]; then
    touch $NVIM_CACHE_HOME/plugin
    if prompt 'Would you like to install plugins of nvim'; then
      cmd="git clone https://github.com/Shougo/dein.vim $DEIN_HOME"
      spinner 'Clone dein.vim' "$cmd" 1
      spinner "Clone plugins with dein.vim" 'nvim +q' 1
    fi
  fi

  if [[ ! -f $TMUX_CACHE_HOME/plugin ]]; then
    touch $TMUX_CACHE_HOME/plugin
    if prompt 'Would you like to install plugins of tmux'; then
      cmd="git clone https://github.com/tmux-plugins/tpm $TPM_HOME"
      spinner 'Clone tpm' "$cmd" 1
      spinner "Clone plugins with tpm" "$TPM_HOME/scripts/install_plugins.sh" 1
      tpm-init
    fi
  fi

  if [[ -d $ZPLUG_HOME ]]; then
    # Zplug
    . $ZPLUG_HOME/init.zsh

    zplug 'zplug/zplug'
    zplug 'ytet5uy4/pctl'
    zplug 'ytet5uy4/dctl'
    zplug 'ytet5uy4/feedly-zsh'
    zplug 'ytet5uy4/fzf-widgets'
    zplug 'ytet5uy4/abyss.zsh', as:theme
    zplug 'b4b4r07/zsh-gomi'
    zplug 'b4b4r07/ssh-keyreg'
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

    zplug check 'b4b4r07/zsh-gomi' && alias gm=gomi

    if zplug check 'ytet5uy4/fzf-widgets'; then
      bindkey '^@'   fzf-select-widget
      bindkey '^@c'  fzf-change-dir
      bindkey '^\'   fzf-change-recent-dir
      bindkey '^@g'  fzf-change-repository
      bindkey '^@f'  fzf-edit-files
      bindkey '^@.'  fzf-edit-dotfiles
      bindkey '^r'   fzf-exec-history
      bindkey '^@s'  fzf-exec-ssh
      bindkey '^@ga' fzf-git-add
      bindkey '^@gb' fzf-git-checkout
      bindkey '^@p'  fzf-copy-password
      bindkey '^@n'  fzf-switch-network
    fi
  fi
}
