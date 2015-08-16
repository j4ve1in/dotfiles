if [ `uname` = Linux ]; then
  if which finger >/dev/null 2>&1; then
    finger -l
  fi
fi

if [ ! `uname` = Darwin ]; then
  eval `dircolors -b ~/.dir_colors`
fi

stty stop undef
