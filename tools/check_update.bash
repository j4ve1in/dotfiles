LOCAL=$(git -C ~/.dotfiles log HEAD)
REMOTE=$(git -C ~/.dotfiles log origin/HEAD)
[ "$LOCAL" = "$REMOTE" ] && echo -e 'up to date\n' || echo -e 'local out of date\n'
