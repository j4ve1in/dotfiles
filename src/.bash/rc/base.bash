# Source global definitions
if [ "$OSTYPE" = "msys" ]; then
  if [ -f /etc/bashrc ]; then
    /etc/bashrc
  fi
fi

# vimode
set -o vi

# shopt
shopt -s autocd
shopt -s cdable_vars
shopt -s cdspell
shopt -s dotglob
shopt -s extglob
shopt -s globstar
shopt -s nocaseglob
shopt -s nocasematch

# alias
if has hub >/dev/null 2>&1; then
  eval "`hub alias -s`"
fi
