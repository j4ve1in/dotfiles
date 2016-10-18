. $ZDOTDIR/autoload/init.zsh ${(%):-%N}

is-arch || is-alpine && . ~/.zshenv

: "Display LastLogin" && () {
  if has lastlog && [[ -f /var/log/lastlog ]]; then
    set -- `last -R | sed -n 2p`
    private port="$2" date="$3 $4 $5 $6"
    print-section 'LastLogin' "$date on $port"
  fi
}

: "Launch tmux" && () {
  if has tmux && [[ -z $TMUX ]]; then
    if [[ $USER = wemux ]]; then
      wemux
    else
      tmux attach -d >/dev/null 2>&1 || tmux
    fi
  fi
}

: 'Catenate configuration files of zsh' && () {
  private -a file
  file=( $ZDOTDIR/rc/{init,plugins,base,aliases,completion,prompt,local}.zsh )

  for f in $file; do
    if [[ $f -nt $ZDOTDIR/.zshrc ]]; then
      print-header 'Catenate configuration files of zsh'
      print " $ZDOTDIR/rc/* > $ZDOTDIR/.zshrc"
      cat $file > $ZDOTDIR/.zshrc
      return 0
    fi
  done
}

: "Compile configuration files of zsh" && () {
  private -a file
  file=(
    ~/.zshenv
    $ZDOTDIR/.z{profile,shrc}
  )

  # Check
  private i N
  i=0
  for f in $file; do
    if [[ ! -f $f.zwc || $f -nt $f.zwc ]]; then
      ((i=i+1))
    fi
  done
  N=$i

  # Start
  if (( $N )); then
    i=1
    print-header 'Compile configuration files of zsh'
    for f in $file; do
      if [[ ! -f $f.zwc || $f -nt $f.zwc ]]; then
        printf ' '
        print-log "$i" "$N" 'Compile:' "$f"
        zcompile $f
        ((i=i+1))
      fi
    done
  fi
}
