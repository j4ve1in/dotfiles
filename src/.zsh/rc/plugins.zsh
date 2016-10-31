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

    private -a zplug_args
    zplug_args=(
      'zplug/zplug'
      'ytet5uy4/pctl'
      'ytet5uy4/dctl'
      'b4b4r07/zsh-gomi'
      'zsh-users/zsh-completions'
      'zsh-users/zsh-autosuggestions'
      'zsh-users/zsh-syntax-highlighting, nice:10'
      'junegunn/fzf-bin, as:command, from:gh-r, rename-to:fzf'
      'junegunn/fzf, as:command, use:bin/fzf-tmux'
      'stedolan/jq, from:gh-r, as:command, rename-to:jq'
      'ytet5uy4/feedly-zsh, on:stedolan/jq'
    )
    for arg in $zplug_args; do zplug $arg; done

    if ! zplug check; then
      if prompt 'Would you like to install plugins of zsh'; then
        private n=$(print-color-bold "$(zplug check --verbose | wc -l)" "$fg[main]")
        spinner "Clone $n plugins with zplug" 'zplug install' 1
      fi
    fi

    zplug load

    if zplug check 'zsh-users/zsh-autosuggestions'; then
      unset ZSH_AUTOSUGGEST_ACCEPT_WIDGETS
      bindkey '^Y' autosuggest-accept
    fi

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
