# Source global definitions
if [ "$OSTYPE" = "cygwin" ]; then
    if [ -f /etc/bashrc ]; then
        /etc/bashrc
    fi
fi

# vimode
set -o vi

# autocd
shopt -s autocd

# cdable_vars
shopt -s cdable_vars

# cdspell
shopt -s cdspell

# dotglob
shopt -s dotglob

# extglob
shopt -s extglob

# globstar
shopt -s globstar

# nocaseglob
shopt -s nocaseglob

# nocasematch
shopt -s nocasematch
