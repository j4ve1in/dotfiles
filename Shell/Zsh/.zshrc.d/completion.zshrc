autoload -Uz compinit
compinit -u
setopt autopushd
setopt pushd_ignore_dups
setopt auto_cd
function cd() {
    builtin cd $@ && ls;
}
setopt list_packed
setopt list_types
setopt correct

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{cyan}Completing %B%d%b%f'
