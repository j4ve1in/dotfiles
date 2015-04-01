if which keychain >/dev/null 2>&1; then
    keychain --nogui --quiet
fi
if which ssh >/dev/null 2>&1; then
    if [ -f ~/.keychain/$HOST-sh ]; then
        source ~/.keychain/$HOST-sh
    fi
fi
