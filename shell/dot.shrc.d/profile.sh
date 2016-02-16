# Load keychain
if type keychain >/dev/null 2>&1; then
  keychain --nogui --quiet
  [ -f ~/.keychain/$HOST-sh ] && source ~/.keychain/$HOST-sh
fi
