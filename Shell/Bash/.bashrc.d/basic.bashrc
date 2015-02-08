# Source global definitions
if [ "$OSTYPE" = "cygwin" ]; then
    if [ -f /etc/bashrc ]; then
        /etc/bashrc
    fi
fi

# vimode
set -o vi
