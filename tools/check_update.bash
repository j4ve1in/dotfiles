LOCAL=$(git -C ~/.dotfiles log HEAD)
REMOTE=$(git -C ~/.dotfiles log origin/HEAD)
if [ "$LOCAL" = "$REMOTE" ];then
  echo "up to date"
else
  echo "local out of date"
fi
echo
