autoload -Uz `ls -F $ZDOTDIR/autoload/**/* | grep -v /`
: "Create user-defined widget" && () {
  private w
  for w in `ls -F $ZDOTDIR/autoload/**/* | grep -v / | grep widget`; do; zle -N $w; done
}
