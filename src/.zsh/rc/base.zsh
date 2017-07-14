# autoload and widget
. $ZDOTDIR/autoload/init.zsh

# option
setopt auto_cd
setopt auto_pushd
setopt complete_in_word
setopt correct
setopt extended_glob
setopt interactive_comments
setopt list_packed
setopt list_types
setopt no_beep
setopt noclobber
setopt notify
setopt pushd_ignore_dups

## history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_no_store
setopt hist_reduce_blanks
setopt share_history

# cd
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs
add-zsh-hook chpwd cd-extend
[[ ! -d $XDG_CACHE_HOME/zsh ]] && mkdir "$XDG_CACHE_HOME/zsh"
zstyle ':chpwd:*' recent-dirs-file "$XDG_CACHE_HOME/zsh/chpwd-recent-dirs"

# direnv
type direnv >/dev/null 2>&1 && eval "`direnv hook zsh`"
