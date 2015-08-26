# Source global definitions
if [ "$OSTYPE" = "cygwin" ]; then
  if [ -f /etc/bashrc ]; then
    /etc/bashrc
  fi
fi

# vimode
set -o vi

shopt -s autocd
shopt -s cdable_vars
shopt -s cdspell
shopt -s dotglob
shopt -s extglob
shopt -s globstar
shopt -s nocaseglob
shopt -s nocasematch
