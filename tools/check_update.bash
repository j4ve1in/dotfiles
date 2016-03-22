LOCAL=$(git -C ~/.dotfiles log HEAD)
REMOTE=$(git -C ~/.dotfiles log origin/HEAD)
[ "$LOCAL" = "$REMOTE" ] && echo 'up to date\n' || echo 'local out of date\n'
