if [ "$OSTYPE" != "cygwin" ]; then
  if which keychain >/dev/null 2>&1; then
    keychain --nogui --quiet >/dev/null 2>&1
    if [ -f ~/.keychain/$HOST-sh ]; then
      source ~/.keychain/$HOST-sh
    fi
  fi
fi
