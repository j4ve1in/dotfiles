if [[ $1 =~ (.zshenv|.zprofile) ]]; then
  fpath=( $fpath $ZDOTDIR/autoload/lib(N-/) )
  autoload -Uz `ls -F $ZDOTDIR/autoload/lib/ | grep -v /`
elif [[ $1 =~ .zshrc ]]; then
  autoload -Uz `ls -F $ZDOTDIR/autoload/*/ | grep -v /`
fi
