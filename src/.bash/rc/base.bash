# Source global definitions
[ "$OSTYPE" = "msys" ] && [ -f /etc/bashrc ] && /etc/bashrc

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
