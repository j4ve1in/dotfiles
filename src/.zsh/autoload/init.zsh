setopt extended_glob
autoload -Uz add-zsh-hook

fpath=( $fpath $ZDOTDIR/autoload/lib/*(N-/) )
autoload -Uz `ls -F $ZDOTDIR/autoload/lib/*/ | grep -v /`
set-env

if [[ $1 =~ .zshrc ]]; then
  autoload -Uz `ls -F $ZDOTDIR/autoload/^lib/ | grep -v /`
  : "Create user-defined widget" && () {
    private w
    for w in `ls -F $ZDOTDIR/autoload/^lib/ | grep -v / | grep widget`; do; zle -N $w; done
  }
fi
